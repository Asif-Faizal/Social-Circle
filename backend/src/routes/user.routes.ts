import { ServerUnaryCall, sendUnaryData } from '@grpc/grpc-js';
import { UserController } from '../controllers/user.controller';

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
  }
}; 