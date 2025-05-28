import User, { IUser } from '../models/user.model';
import { generateAccessToken, generateRefreshToken, verifyToken } from '../utils/jwt';
import { generateOTP, saveOTP, sendOTPEmail, verifyOTP } from '../utils/email';
import { DeviceSessionService, DeviceInfo } from './device-session.service';

export interface RegisterUserInput {
  username: string;
  email: string;
  password: string;
  deviceId: string;
  deviceOS: string;
}

export interface LoginUserInput {
  email: string;
  password: string;
  deviceId: string;
  deviceOS: string;
}

export interface RefreshTokenInput {
  refreshToken: string;
  deviceId: string;
  deviceOS: string;
}

export interface SendOTPInput {
  email: string;
  deviceId: string;
  deviceOS: string;
}

export interface VerifyOTPInput {
  email: string;
  otp: string;
  deviceId: string;
  deviceOS: string;
}

export interface UserOutput {
  success: boolean;
  message: string;
  accessToken?: string;
  refreshToken?: string;
  user?: {
    id: string;
    username: string;
    email: string;
  };
}

export interface OTPOutput {
  success: boolean;
  message: string;
}

export interface GetActiveSessionsInput {
  userId: string;
}

export interface LogoutDeviceInput {
  userId: string;
  deviceId: string;
}

export interface LogoutAllDevicesInput {
  userId: string;
}

export interface DeviceSessionOutput {
  id: string;
  deviceId: string;
  deviceOS: string;
  lastActivity: string;
  isActive: boolean;
}

export interface ActiveSessionsOutput {
  success: boolean;
  message: string;
  sessions?: DeviceSessionOutput[];
}

export interface LogoutOutput {
  success: boolean;
  message: string;
  loggedOutCount?: number;
}

export interface CheckEmailInput {
  email: string;
}

export interface CheckEmailOutput {
  success: boolean;
  message: string;
  isRegistered: boolean;
}

export interface GetUserInfoInput {
  userId: string;
}

export interface GetUserInfoOutput {
  success: boolean;
  message: string;
  user?: {
    id: string;
    username: string;
    email: string;
  };
}

export class UserService {
  private deviceSessionService: DeviceSessionService;

  constructor() {
    this.deviceSessionService = new DeviceSessionService();
  }

  async registerUser(input: RegisterUserInput): Promise<UserOutput> {
    try {
      // Validate device info
      const deviceInfo: DeviceInfo = {
        deviceId: input.deviceId,
        deviceOS: input.deviceOS,
      };

      if (!this.deviceSessionService.validateDeviceInfo(deviceInfo)) {
        return {
          success: false,
          message: 'Invalid device information',
        };
      }

      // Check if user already exists
      const existingUser = await User.findOne({
        $or: [{ username: input.username }, { email: input.email }],
      });

      if (existingUser) {
        return {
          success: false,
          message: 'Username or email already exists',
        };
      }

      // Create new user
      const user = await User.create({
        username: input.username,
        email: input.email,
        password: input.password,
      });

      // Create device session
      await this.deviceSessionService.createOrUpdateSession(user.id, deviceInfo);

      // Generate tokens
      const accessToken = generateAccessToken(user);
      const refreshToken = generateRefreshToken(user);

      return {
        success: true,
        message: 'User registered successfully',
        accessToken,
        refreshToken,
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
        },
      };
    } catch (error) {
      console.error('Error registering user:', error);
      return {
        success: false,
        message: 'Error registering user',
      };
    }
  }

  async loginUser(input: LoginUserInput): Promise<UserOutput> {
    try {
      // Validate device info
      const deviceInfo: DeviceInfo = {
        deviceId: input.deviceId,
        deviceOS: input.deviceOS,
      };

      if (!this.deviceSessionService.validateDeviceInfo(deviceInfo)) {
        return {
          success: false,
          message: 'Invalid device information',
        };
      }

      // Find user by email
      const user = await User.findOne({ email: input.email });

      // Check if user exists
      if (!user) {
        return {
          success: false,
          message: 'Invalid email or password',
        };
      }

      // Verify password
      const isPasswordValid = await user.comparePassword(input.password);
      
      if (!isPasswordValid) {
        return {
          success: false,
          message: 'Invalid email or password',
        };
      }

      // Create or update device session
      await this.deviceSessionService.createOrUpdateSession(user.id, deviceInfo);

      // Generate tokens
      const accessToken = generateAccessToken(user);
      const refreshToken = generateRefreshToken(user);

      return {
        success: true,
        message: 'Login successful',
        accessToken,
        refreshToken,
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
        },
      };
    } catch (error) {
      console.error('Error during login:', error);
      return {
        success: false,
        message: 'Error during login',
      };
    }
  }

  async refreshToken(input: RefreshTokenInput): Promise<UserOutput> {
    try {
      // Validate device info
      const deviceInfo: DeviceInfo = {
        deviceId: input.deviceId,
        deviceOS: input.deviceOS,
      };

      if (!this.deviceSessionService.validateDeviceInfo(deviceInfo)) {
        return {
          success: false,
          message: 'Invalid device information',
        };
      }

      // Verify refresh token
      const decoded = verifyToken(input.refreshToken);
      
      if (decoded.type !== 'refresh') {
        return {
          success: false,
          message: 'Invalid refresh token',
        };
      }

      // Find user
      const user = await User.findById(decoded.id);
      
      if (!user) {
        return {
          success: false,
          message: 'User not found',
        };
      }

      // Verify device session exists
      const session = await this.deviceSessionService.getSession(user.id, deviceInfo.deviceId);
      
      if (!session) {
        return {
          success: false,
          message: 'Invalid device session',
        };
      }

      // Generate new tokens
      const accessToken = generateAccessToken(user);
      const refreshToken = generateRefreshToken(user);

      return {
        success: true,
        message: 'Token refreshed successfully',
        accessToken,
        refreshToken,
      };
    } catch (error) {
      console.error('Error refreshing token:', error);
      return {
        success: false,
        message: 'Error refreshing token',
      };
    }
  }

  async sendOTP(input: SendOTPInput): Promise<OTPOutput> {
    try {
      // Validate device info
      const deviceInfo: DeviceInfo = {
        deviceId: input.deviceId,
        deviceOS: input.deviceOS,
      };

      if (!this.deviceSessionService.validateDeviceInfo(deviceInfo)) {
        return {
          success: false,
          message: 'Invalid device information',
        };
      }

      // Generate OTP
      const otp = generateOTP();

      // Save OTP to database with device info
      await saveOTP(input.email, otp, deviceInfo);

      // Send OTP via email
      const emailSent = await sendOTPEmail(input.email, otp);

      if (!emailSent) {
        return {
          success: false,
          message: 'Failed to send OTP email',
        };
      }

      return {
        success: true,
        message: 'OTP sent successfully',
      };
    } catch (error) {
      console.error('Error sending OTP:', error);
      return {
        success: false,
        message: 'Error sending OTP',
      };
    }
  }

  async verifyOTP(input: VerifyOTPInput): Promise<OTPOutput> {
    try {
      // Validate device info
      const deviceInfo: DeviceInfo = {
        deviceId: input.deviceId,
        deviceOS: input.deviceOS,
      };

      if (!this.deviceSessionService.validateDeviceInfo(deviceInfo)) {
        return {
          success: false,
          message: 'Invalid device information',
        };
      }

      // Verify OTP with device info
      const isValid = await verifyOTP(input.email, input.otp, deviceInfo);

      if (!isValid) {
        return {
          success: false,
          message: 'Invalid or expired OTP',
        };
      }

      return {
        success: true,
        message: 'OTP verified successfully',
      };
    } catch (error) {
      console.error('Error verifying OTP:', error);
      return {
        success: false,
        message: 'Error verifying OTP',
      };
    }
  }

  async getActiveSessions(input: GetActiveSessionsInput): Promise<ActiveSessionsOutput> {
    try {
      const sessions = await this.deviceSessionService.getUserActiveSessions(input.userId);

      const sessionData: DeviceSessionOutput[] = sessions.map(session => ({
        id: session.id,
        deviceId: session.deviceId,
        deviceOS: session.deviceOS,
        lastActivity: session.lastActivity.toISOString(),
        isActive: session.isActive,
      }));

      return {
        success: true,
        message: 'Active sessions retrieved successfully',
        sessions: sessionData,
      };
    } catch (error) {
      console.error('Error getting active sessions:', error);
      return {
        success: false,
        message: 'Error retrieving active sessions',
      };
    }
  }

  async logoutDevice(input: LogoutDeviceInput): Promise<LogoutOutput> {
    try {
      const result = await this.deviceSessionService.deactivateSession(
        input.userId,
        input.deviceId
      );

      if (!result) {
        return {
          success: false,
          message: 'Device session not found',
        };
      }

      return {
        success: true,
        message: 'Device logged out successfully',
      };
    } catch (error) {
      console.error('Error logging out device:', error);
      return {
        success: false,
        message: 'Error logging out device',
      };
    }
  }

  async logoutAllDevices(input: LogoutAllDevicesInput): Promise<LogoutOutput> {
    try {
      const loggedOutCount = await this.deviceSessionService.deactivateAllUserSessions(
        input.userId
      );

      return {
        success: true,
        message: 'All devices logged out successfully',
        loggedOutCount,
      };
    } catch (error) {
      console.error('Error logging out all devices:', error);
      return {
        success: false,
        message: 'Error logging out all devices',
      };
    }
  }

  async checkEmail(input: CheckEmailInput): Promise<CheckEmailOutput> {
    try {
      // Validate email format
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(input.email)) {
        return {
          success: false,
          message: 'Invalid email format',
          isRegistered: false
        };
      }

      // Convert email to lowercase for case-insensitive comparison
      const normalizedEmail = input.email.toLowerCase();

      // Check if user exists with this email
      const existingUser = await User.findOne({ 
        email: normalizedEmail 
      }).exec();

      const isRegistered = !!existingUser;
      
      return {
        success: true,
        message: isRegistered ? 'Email is already registered' : 'Email is available',
        isRegistered: isRegistered
      };
    } catch (error) {
      console.error('Error checking email:', error);
      return {
        success: false,
        message: 'Error checking email',
        isRegistered: false
      };
    }
  }

  async getUserInfo(input: GetUserInfoInput): Promise<GetUserInfoOutput> {
    try {
      // Fetch user from database
      const user = await User.findById(input.userId);

      if (!user) {
        return {
          success: false,
          message: 'User not found',
        };
      }

      return {
        success: true,
        message: 'User info retrieved successfully',
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
        },
      };
    } catch (error) {
      console.error('Error getting user info:', error);
      return {
        success: false,
        message: 'Error getting user info',
      };
    }
  }
} 