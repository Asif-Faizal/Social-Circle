import { ServerUnaryCall, sendUnaryData } from '@grpc/grpc-js';
import { UserService, RegisterUserInput, LoginUserInput, SendOTPInput, VerifyOTPInput, GetActiveSessionsInput, LogoutDeviceInput, LogoutAllDevicesInput, RefreshTokenInput } from '../services/user.service';

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
      const { user_id } = call.request;

      // Validate input
      if (!user_id) {
        callback({
          code: 3, // INVALID_ARGUMENT
          message: 'User ID is required',
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
    } catch (error) {
      console.error('Error in getActiveSessions controller:', error);
      callback({
        code: 13, // INTERNAL
        message: 'Internal server error',
      });
    }
  }

  async logoutDevice(
    call: ServerUnaryCall<LogoutDeviceRequest, LogoutResponse>,
    callback: sendUnaryData<LogoutResponse>
  ): Promise<void> {
    try {
      const { user_id, device_id } = call.request;

      // Validate input
      if (!user_id || !device_id) {
        callback({
          code: 3, // INVALID_ARGUMENT
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
    } catch (error) {
      console.error('Error in logoutDevice controller:', error);
      callback({
        code: 13, // INTERNAL
        message: 'Internal server error',
      });
    }
  }

  async logoutAllDevices(
    call: ServerUnaryCall<LogoutAllDevicesRequest, LogoutResponse>,
    callback: sendUnaryData<LogoutResponse>
  ): Promise<void> {
    try {
      const { user_id } = call.request;

      // Validate input
      if (!user_id) {
        callback({
          code: 3, // INVALID_ARGUMENT
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
    } catch (error) {
      console.error('Error in logoutAllDevices controller:', error);
      callback({
        code: 13, // INTERNAL
        message: 'Internal server error',
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
} 