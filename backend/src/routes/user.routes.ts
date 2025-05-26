import { ServerUnaryCall, sendUnaryData } from '@grpc/grpc-js';
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
  token: string;
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
  }
}; 