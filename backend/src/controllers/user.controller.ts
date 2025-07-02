import { ServerUnaryCall, sendUnaryData, status } from '@grpc/grpc-js';
import { UserService, RegisterUserInput, LoginUserInput, SendOTPInput, VerifyOTPInput, GetActiveSessionsInput, LogoutDeviceInput, LogoutAllDevicesInput, RefreshTokenInput } from '../services/user.service';
import { authenticate } from '../middleware/auth.middleware';

// Response interfaces
interface CheckEmailResponse {
  success: boolean;
  message: string;
  is_registered: boolean;
}

interface CheckEmailRequest {
  email: string;
}

interface RegisterRequest {
  username: string;
  email: string;
  password: string;
  device_id: string;
  device_os: string;
}

interface LoginRequest {
  email: string;
  password: string;
  device_id: string;
  device_os: string;
}

interface SendOTPRequest {
  email: string;
  device_id: string;
  device_os: string;
}

interface VerifyOTPRequest {
  email: string;
  otp: string;
  device_id: string;
  device_os: string;
}

interface UserResponse {
  success: boolean;
  message: string;
  access_token: string;
  refresh_token: string;
  user: {
    id: string;
    username: string;
    email: string;
  };
}

interface OTPResponse {
  success: boolean;
  message: string;
}

interface GetActiveSessionsRequest {
  user_id: string;
}

interface LogoutDeviceRequest {
  user_id: string;
  device_id: string;
}

interface LogoutAllDevicesRequest {
  user_id: string;
}

interface ActiveSessionsResponse {
  success: boolean;
  message: string;
  sessions: {
    id: string;
    device_id: string;
    device_os: string;
    last_activity: string;
    is_active: boolean;
  }[];
}

interface LogoutResponse {
  success: boolean;
  message: string;
  logged_out_count?: number;
}

interface RefreshTokenRequest {
  refresh_token: string;
  device_id: string;
  device_os: string;
}

interface RefreshTokenResponse {
  success: boolean;
  message: string;
  access_token: string;
  refresh_token: string;
}

interface GetUserInfoRequest {
  // Authenticate request
}

interface GetUserInfoResponse {
  success: boolean;
  message: string;
  user: {
    id: string;
    username: string;
    email: string;
  };
}

interface GetAllUsersRequest {
  // No fields needed
}

interface GetAllUsersResponse {
  success: boolean;
  message: string;
  users: {
    id: string;
    username: string;
    email: string;
  }[];
}

export class UserController {
  private userService: UserService;

  constructor() {
    this.userService = new UserService();
  }

  async register(
    call: ServerUnaryCall<RegisterRequest, UserResponse>,
    callback: sendUnaryData<UserResponse>
  ): Promise<void> {
    try {
      const { username, email, password, device_id, device_os } = call.request;

      // Validate input
      if (!username || !email || !password || !device_id || !device_os) {
        callback({
          code: 3, // INVALID_ARGUMENT
          message: 'Username, email, password, device_id, and device_os are required',
        });
        return;
      }

      const input: RegisterUserInput = {
        username,
        email,
        password,
        deviceId: device_id,
        deviceOS: device_os,
      };

      const result = await this.userService.registerUser(input);

      if (!result.success) {
        callback(null, {
          success: false,
          message: result.message,
          access_token: '',
          refresh_token: '',
          user: {
            id: '',
            username: '',
            email: '',
          },
        });
        return;
      }

      callback(null, {
        success: true,
        message: result.message,
        access_token: result.accessToken || '',
        refresh_token: result.refreshToken || '',
        user: result.user || {
          id: '',
          username: '',
          email: '',
        },
      });
    } catch (error) {
      console.error('Error in register controller:', error);
      callback({
        code: 13, // INTERNAL
        message: 'Internal server error',
      });
    }
  }

  async login(
    call: ServerUnaryCall<LoginRequest, UserResponse>,
    callback: sendUnaryData<UserResponse>
  ): Promise<void> {
    try {
      const { email, password, device_id, device_os } = call.request;

      // Validate input
      if (!email || !password || !device_id || !device_os) {
        callback({
          code: 3, // INVALID_ARGUMENT
          message: 'Email, password, device_id, and device_os are required',
        });
        return;
      }

      const input: LoginUserInput = {
        email,
        password,
        deviceId: device_id,
        deviceOS: device_os,
      };

      const result = await this.userService.loginUser(input);

      if (!result.success) {
        callback(null, {
          success: false,
          message: result.message,
          access_token: '',
          refresh_token: '',
          user: {
            id: '',
            username: '',
            email: '',
          },
        });
        return;
      }

      callback(null, {
        success: true,
        message: result.message,
        access_token: result.accessToken || '',
        refresh_token: result.refreshToken || '',
        user: result.user || {
          id: '',
          username: '',
          email: '',
        },
      });
    } catch (error) {
      console.error('Error in login controller:', error);
      callback({
        code: 13, // INTERNAL
        message: 'Internal server error',
      });
    }
  }

  async sendOTP(
    call: ServerUnaryCall<SendOTPRequest, OTPResponse>,
    callback: sendUnaryData<OTPResponse>
  ): Promise<void> {
    try {
      const { email, device_id, device_os } = call.request;

      // Validate input
      if (!email || !device_id || !device_os) {
        callback({
          code: 3, // INVALID_ARGUMENT
          message: 'Email, device_id, and device_os are required',
        });
        return;
      }

      const input: SendOTPInput = { 
        email, 
        deviceId: device_id, 
        deviceOS: device_os 
      };

      const result = await this.userService.sendOTP(input);

      callback(null, {
        success: result.success,
        message: result.message,
      });
    } catch (error) {
      console.error('Error in sendOTP controller:', error);
      callback({
        code: 13, // INTERNAL
        message: 'Internal server error',
      });
    }
  }

  async verifyOTP(
    call: ServerUnaryCall<VerifyOTPRequest, OTPResponse>,
    callback: sendUnaryData<OTPResponse>
  ): Promise<void> {
    try {
      const { email, otp, device_id, device_os } = call.request;

      // Validate input
      if (!email || !otp || !device_id || !device_os) {
        callback({
          code: 3, // INVALID_ARGUMENT
          message: 'Email, otp, device_id, and device_os are required',
        });
        return;
      }

      const input: VerifyOTPInput = { 
        email, 
        otp, 
        deviceId: device_id, 
        deviceOS: device_os 
      };

      const result = await this.userService.verifyOTP(input);

      callback(null, {
        success: result.success,
        message: result.message,
      });
    } catch (error) {
      console.error('Error in verifyOTP controller:', error);
      callback({
        code: 13, // INTERNAL
        message: 'Internal server error',
      });
    }
  }

  async getActiveSessions(
    call: ServerUnaryCall<GetActiveSessionsRequest, ActiveSessionsResponse>,
    callback: sendUnaryData<ActiveSessionsResponse>
  ): Promise<void> {
    try {
      // Authenticate request
      const auth = authenticate(call);

      // Validate that the requested user_id matches the authenticated user
      const { user_id } = call.request;
      if (user_id !== auth.userId) {
        callback({
          code: status.PERMISSION_DENIED,
          message: 'You can only view your own sessions',
        });
        return;
      }

      const input: GetActiveSessionsInput = { userId: user_id };
      const result = await this.userService.getActiveSessions(input);

      callback(null, {
        success: result.success,
        message: result.message,
        sessions: result.sessions?.map(session => ({
          id: session.id,
          device_id: session.deviceId,
          device_os: session.deviceOS,
          last_activity: session.lastActivity,
          is_active: session.isActive,
        })) || [],
      });
    } catch (error: any) {
      console.error('Error in getActiveSessions controller:', error);
      callback({
        code: error.code || status.INTERNAL,
        message: error.message || 'Internal server error',
      });
    }
  }

  async logoutDevice(
    call: ServerUnaryCall<LogoutDeviceRequest, LogoutResponse>,
    callback: sendUnaryData<LogoutResponse>
  ): Promise<void> {
    try {
      // Authenticate request
      const auth = authenticate(call);

      const { user_id, device_id } = call.request;

      // Validate that the requested user_id matches the authenticated user
      if (user_id !== auth.userId) {
        callback({
          code: status.PERMISSION_DENIED,
          message: 'You can only logout your own devices',
        });
        return;
      }

      // Validate input
      if (!user_id || !device_id) {
        callback({
          code: status.INVALID_ARGUMENT,
          message: 'User ID and device ID are required',
        });
        return;
      }

      const input: LogoutDeviceInput = { 
        userId: user_id, 
        deviceId: device_id 
      };

      const result = await this.userService.logoutDevice(input);

      callback(null, {
        success: result.success,
        message: result.message,
      });
    } catch (error: any) {
      console.error('Error in logoutDevice controller:', error);
      callback({
        code: error.code || status.INTERNAL,
        message: error.message || 'Internal server error',
      });
    }
  }

  async logoutAllDevices(
    call: ServerUnaryCall<LogoutAllDevicesRequest, LogoutResponse>,
    callback: sendUnaryData<LogoutResponse>
  ): Promise<void> {
    try {
      // Authenticate request
      const auth = authenticate(call);

      const { user_id } = call.request;

      // Validate that the requested user_id matches the authenticated user
      if (user_id !== auth.userId) {
        callback({
          code: status.PERMISSION_DENIED,
          message: 'You can only logout your own devices',
        });
        return;
      }

      // Validate input
      if (!user_id) {
        callback({
          code: status.INVALID_ARGUMENT,
          message: 'User ID is required',
        });
        return;
      }

      const input: LogoutAllDevicesInput = { userId: user_id };

      const result = await this.userService.logoutAllDevices(input);

      callback(null, {
        success: result.success,
        message: result.message,
        logged_out_count: result.loggedOutCount,
      });
    } catch (error: any) {
      console.error('Error in logoutAllDevices controller:', error);
      callback({
        code: error.code || status.INTERNAL,
        message: error.message || 'Internal server error',
      });
    }
  }

  async refreshToken(
    call: ServerUnaryCall<RefreshTokenRequest, RefreshTokenResponse>,
    callback: sendUnaryData<RefreshTokenResponse>
  ): Promise<void> {
    try {
      const { refresh_token, device_id, device_os } = call.request;

      // Validate input
      if (!refresh_token || !device_id || !device_os) {
        callback({
          code: 3, // INVALID_ARGUMENT
          message: 'Refresh token, device_id, and device_os are required',
        });
        return;
      }

      const input: RefreshTokenInput = {
        refreshToken: refresh_token,
        deviceId: device_id,
        deviceOS: device_os,
      };

      const result = await this.userService.refreshToken(input);

      if (!result.success) {
        callback(null, {
          success: false,
          message: result.message,
          access_token: '',
          refresh_token: '',
        });
        return;
      }

      callback(null, {
        success: true,
        message: result.message,
        access_token: result.accessToken || '',
        refresh_token: result.refreshToken || '',
      });
    } catch (error) {
      console.error('Error in refresh token controller:', error);
      callback({
        code: 13, // INTERNAL
        message: 'Internal server error',
      });
    }
  }

  async checkEmail(
    call: ServerUnaryCall<CheckEmailRequest, CheckEmailResponse>,
    callback: sendUnaryData<CheckEmailResponse>
  ): Promise<void> {
    try {
      const { email } = call.request;

      // Validate input
      if (!email) {
        callback({
          code: status.INVALID_ARGUMENT,
          message: 'Email is required',
        });
        return;
      }

      const input = { email };
      const result = await this.userService.checkEmail(input);

      console.log('Service result:', result);

      // Create response object with explicit typing
      const response: CheckEmailResponse = {
        success: result.success,
        message: result.message,
        is_registered: result.isRegistered
      };

      // Force all fields to be present
      Object.defineProperty(response, 'is_registered', {
        enumerable: true,
        value: result.isRegistered
      });

      console.log('Sending response:', response);
      console.log('Response keys:', Object.keys(response));

      // Send the response
      callback(null, response);
    } catch (error: any) {
      console.error('Error in checkEmail controller:', error);
      callback({
        code: error.code || status.INTERNAL,
        message: error.message || 'Internal server error',
      });
    }
  }

  async getUserInfo(
    call: ServerUnaryCall<GetUserInfoRequest, GetUserInfoResponse>,
    callback: sendUnaryData<GetUserInfoResponse>
  ): Promise<void> {
    try {
      // Authenticate request
      const auth = authenticate(call);

      const input = { userId: auth.userId };
      const result = await this.userService.getUserInfo(input);

      if (!result.success || !result.user) {
        callback(null, {
          success: false,
          message: result.message,
          user: {
            id: '',
            username: '',
            email: '',
          },
        });
        return;
      }

      callback(null, {
        success: true,
        message: result.message,
        user: result.user,
      });
    } catch (error: any) {
      console.error('Error in getUserInfo controller:', error);
      callback({
        code: error.code || status.INTERNAL,
        message: error.message || 'Internal server error',
      });
    }
  }

  async getAllUsers(
    call: ServerUnaryCall<GetAllUsersRequest, GetAllUsersResponse>,
    callback: sendUnaryData<GetAllUsersResponse>
  ): Promise<void> {
    try {
      // Authenticate request
      const auth = authenticate(call);

      const result = await this.userService.getAllUsers();

      if (!result.success) {
        callback(null, {
          success: false,
          message: result.message,
          users: [],
        });
        return;
      }

      callback(null, {
        success: true,
        message: result.message,
        users: result.users || [],
      });
    } catch (error: any) {
      console.error('Error in getAllUsers controller:', error);
      callback({
        code: error.code || status.INTERNAL,
        message: error.message || 'Internal server error',
      });
    }
  }
} 