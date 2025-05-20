import { ServerUnaryCall, sendUnaryData } from '@grpc/grpc-js';
import { UserService, RegisterUserInput, LoginUserInput } from '../services/user.service';

interface RegisterRequest {
  username: string;
  email: string;
  password: string;
}

interface LoginRequest {
  email: string;
  password: string;
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
} 