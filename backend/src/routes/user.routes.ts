import { ServerUnaryCall, sendUnaryData } from '@grpc/grpc-js';
import { UserController } from '../controllers/user.controller';

interface RegisterRequest {
  username: string;
  email: string;
  password: string;
}

interface RegisterResponse {
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
    call: ServerUnaryCall<RegisterRequest, RegisterResponse>,
    callback: sendUnaryData<RegisterResponse>
  ): Promise<void> => {
    await userController.register(call, callback);
  }
}; 