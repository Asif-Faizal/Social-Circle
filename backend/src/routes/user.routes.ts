import { ServerUnaryCall, sendUnaryData, status } from '@grpc/grpc-js';
import { UserController } from '../controllers/user.controller';

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

interface OTPResponse {
  success: boolean;
  message: string;
}

interface GetActiveSessionsRequest {
  user_id: string;
}

interface ActiveSessionsResponse {
  success: boolean;
  message: string;
  sessions: Array<{
    id: string;
    device_id: string;
    device_os: string;
    last_activity: string;
    is_active: boolean;
  }>;
}

interface LogoutDeviceRequest {
  user_id: string;
  device_id: string;
}

interface LogoutAllDevicesRequest {
  user_id: string;
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

interface CheckEmailRequest {
  email: string;
}

interface CheckEmailResponse {
  success: boolean;
  message: string;
  is_registered: boolean;
}

interface GetUserInfoRequest {
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
}

interface GetAllUsersResponse {
  success: boolean;
  message: string;
  users: Array<{
    id: string;
    username: string;
    email: string;
  }>;
}

// Initialize controller
const userController = new UserController();

// Define route handlers for user service
export const userRoutes = {
  // Register user handler
  register: async (
    call: ServerUnaryCall<RegisterRequest, UserResponse>,
    callback: sendUnaryData<UserResponse>
  ): Promise<void> => {
    await userController.register(call, callback);
  },

  // Login user handler
  login: async (
    call: ServerUnaryCall<LoginRequest, UserResponse>,
    callback: sendUnaryData<UserResponse>
  ): Promise<void> => {
    await userController.login(call, callback);
  },

  // Send OTP handler
  sendOTP: async (
    call: ServerUnaryCall<SendOTPRequest, OTPResponse>,
    callback: sendUnaryData<OTPResponse>
  ): Promise<void> => {
    await userController.sendOTP(call, callback);
  },

  // Verify OTP handler
  verifyOTP: async (
    call: ServerUnaryCall<VerifyOTPRequest, OTPResponse>,
    callback: sendUnaryData<OTPResponse>
  ): Promise<void> => {
    await userController.verifyOTP(call, callback);
  },

  // Get active sessions handler
  getActiveSessions: async (
    call: ServerUnaryCall<GetActiveSessionsRequest, ActiveSessionsResponse>,
    callback: sendUnaryData<ActiveSessionsResponse>
  ): Promise<void> => {
    await userController.getActiveSessions(call, callback);
  },

  // Logout device handler
  logoutDevice: async (
    call: ServerUnaryCall<LogoutDeviceRequest, LogoutResponse>,
    callback: sendUnaryData<LogoutResponse>
  ): Promise<void> => {
    await userController.logoutDevice(call, callback);
  },

  // Logout all devices handler
  logoutAllDevices: async (
    call: ServerUnaryCall<LogoutAllDevicesRequest, LogoutResponse>,
    callback: sendUnaryData<LogoutResponse>
  ): Promise<void> => {
    await userController.logoutAllDevices(call, callback);
  },

  // Refresh token handler
  refreshToken: async (
    call: ServerUnaryCall<RefreshTokenRequest, RefreshTokenResponse>,
    callback: sendUnaryData<RefreshTokenResponse>
  ): Promise<void> => {
    await userController.refreshToken(call, callback);
  },

  // Check email handler
  checkEmail: async (
    call: ServerUnaryCall<CheckEmailRequest, CheckEmailResponse>,
    callback: sendUnaryData<CheckEmailResponse>
  ): Promise<void> => {
    try {
      await userController.checkEmail(call, callback);
    } catch (error) {
      console.error('Error in checkEmail route:', error);
      callback({
        code: status.INTERNAL,
        message: 'Internal server error',
        details: 'Error processing checkEmail request'
      });
    }
  },

  // Get user info handler
  getUserInfo: async (
    call: ServerUnaryCall<GetUserInfoRequest, GetUserInfoResponse>,
    callback: sendUnaryData<GetUserInfoResponse>
  ): Promise<void> => {
    await userController.getUserInfo(call, callback);
  },

  // Get all users handler
  getAllUsers: async (
    call: ServerUnaryCall<GetAllUsersRequest, GetAllUsersResponse>,
    callback: sendUnaryData<GetAllUsersResponse>
  ): Promise<void> => {
    await userController.getAllUsers(call, callback);
  }
}; 