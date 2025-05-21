import * as grpc from '@grpc/grpc-js';
import * as protoLoader from '@grpc/proto-loader';
import path from 'path';
import { connectToDatabase, closeDatabase } from './utils/database';
import config from './config/config';
import { userRoutes } from './routes/user.routes';

// Load proto file
const PROTO_PATH = path.resolve(__dirname, './proto/user.proto');
console.log('Loading proto file from:', PROTO_PATH);

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

    // Create gRPC server
    const server = new grpc.Server();

    // Directly add the service
    server.addService(userProto.UserService.service, {
      Register: userRoutes.register,
      Login: userRoutes.login,
      SendOTP: userRoutes.sendOTP,
      VerifyOTP: userRoutes.verifyOTP
    });

    // Start server
    server.bindAsync(
      `0.0.0.0:${config.port}`,
      grpc.ServerCredentials.createInsecure(),
      (error, port) => {
        if (error) {
          console.error('Failed to start gRPC server:', error);
          return;
        }
        server.start();
        console.log(`gRPC server running on port ${port}`);
      }
    );

    // Handle shutdown
    const shutdownGracefully = async () => {
      console.log('Shutting down gRPC server...');
      server.tryShutdown(async () => {
        await closeDatabase();
        process.exit(0);
      });
    };

    process.on('SIGINT', shutdownGracefully);
    process.on('SIGTERM', shutdownGracefully);
  } catch (error) {
    console.error('Error starting server:', error);
    process.exit(1);
  }
}

startServer();