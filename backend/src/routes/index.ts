import * as grpc from '@grpc/grpc-js';
import { userRoutes } from './user.routes';

// Register all routes for the gRPC server
export const registerRoutes = (server: grpc.Server, services: any): void => {
  // Register user service routes
  server.addService(services.UserService.service, {
    register: userRoutes.register,
    login: userRoutes.login,
    sendOTP: userRoutes.sendOTP,
    verifyOTP: userRoutes.verifyOTP
  });

  // Add more service routes here as needed
}; 