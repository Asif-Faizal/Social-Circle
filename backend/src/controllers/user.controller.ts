import { ServerUnaryCall, sendUnaryData } from '@grpc/grpc-js';
import { UserService, RegisterUserInput, LoginUserInput, SendOTPInput, VerifyOTPInput } from '../services/user.service';

interface RegisterRequest {
  username: string;
  email: string;
  password: string;
}

interface LoginRequest {
  email: string;
  password: string;
}

interface SendOTPRequest {
  email: string;
}

interface VerifyOTPRequest {
  email: string;
  otp: string;
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
      const { username, email, password } = call.request;

      // Validate input
      if (!username || !email || !password) {
        callback({
          code: 3, // INVALID_ARGUMENT
          message: 'Username, email, and password are required',
        });
        return;
      }

      const input: RegisterUserInput = {
        username,
        email,
        password,
      };

      const result = await this.userService.registerUser(input);

      if (!result.success) {
        callback(null, {
          success: false,
          message: result.message,
          token: '',
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
        token: result.token || '',
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
      const { email, password } = call.request;

      // Validate input
      if (!email || !password) {
        callback({
          code: 3, // INVALID_ARGUMENT
          message: 'Email and password are required',
        });
        return;
      }

      const input: LoginUserInput = {
        email,
        password,
      };

      const result = await this.userService.loginUser(input);

      if (!result.success) {
        callback(null, {
          success: false,
          message: result.message,
          token: '',
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
        token: result.token || '',
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
      const { email } = call.request;

      // Validate input
      if (!email) {
        callback({
          code: 3, // INVALID_ARGUMENT
          message: 'Email is required',
        });
        return;
      }

      const input: SendOTPInput = { email };

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
      const { email, otp } = call.request;

      // Validate input
      if (!email || !otp) {
        callback({
          code: 3, // INVALID_ARGUMENT
          message: 'Email and OTP are required',
        });
        return;
      }

      const input: VerifyOTPInput = { email, otp };

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
} 