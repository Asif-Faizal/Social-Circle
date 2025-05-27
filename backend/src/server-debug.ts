import * as grpc from '@grpc/grpc-js';
import * as protoLoader from '@grpc/proto-loader';
import path from 'path';
import { connectToDatabase, closeDatabase } from './utils/database';
import config from './config/config';
import { UserController } from './controllers/user.controller';

// Load proto file
const PROTO_PATH = path.resolve(__dirname, './proto/user.proto');
console.log('Debug server loading proto file from:', PROTO_PATH);

const packageDefinition = protoLoader.loadSync(PROTO_PATH, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});

const protoDescriptor = grpc.loadPackageDefinition(packageDefinition);
const userProto = protoDescriptor.user as any;

// Debug the service definitions
console.log('Available services:', Object.keys(userProto));
if (userProto.UserService) {
  console.log('Available methods in UserService:', 
    Object.keys(userProto.UserService.service));
}

async function startServer() {
  try {
    // Connect to MongoDB
    await connectToDatabase();

    // Create controller instance
    const userController = new UserController();

    // Create gRPC server
    const server = new grpc.Server();

    console.log('Adding service methods...');
    
    // Define handlers with explicit debug logging
    const handlers: Record<string, (call: any, callback: any) => void> = {
      Register: (call: any, callback: any) => {
        console.log('Register method called');
        userController.register(call, callback);
      },
      Login: (call: any, callback: any) => {
        console.log('Login method called');
        userController.login(call, callback);
      },
      SendOTP: (call: any, callback: any) => {
        console.log('SendOTP method called');
        userController.sendOTP(call, callback);
      },
      VerifyOTP: (call: any, callback: any) => {
        console.log('VerifyOTP method called');
        userController.verifyOTP(call, callback);
      }
    };

    // Check that all methods match
    for (const method of Object.keys(userProto.UserService.service)) {
      if (!handlers[method]) {
        console.error(`Missing implementation for method: ${method}`);
      }
    }

    // Directly add the service with debug info
    console.log('Adding service with these handlers:', Object.keys(handlers));
    server.addService(userProto.UserService.service, handlers);
    
    // Start server
    server.bindAsync(
      `0.0.0.0:${config.port}`,
      grpc.ServerCredentials.createInsecure(),
      (error, port) => {
        if (error) {
          console.error('Failed to start gRPC server:', error);
          return;
        }
        console.log(`Debug gRPC server running on port ${port}`);
      }
    );

    // Handle shutdown
    const shutdownGracefully = async () => {
      console.log('Shutting down debug gRPC server...');
      server.tryShutdown(async () => {
        await closeDatabase();
        process.exit(0);
      });
    };

    process.on('SIGINT', shutdownGracefully);
    process.on('SIGTERM', shutdownGracefully);
  } catch (error) {
    console.error('Error starting debug server:', error);
    process.exit(1);
  }
}

// Start the debug server
console.log('Starting debug server...');
startServer(); 