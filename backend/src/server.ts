import * as grpc from '@grpc/grpc-js';
import * as protoLoader from '@grpc/proto-loader';
import path from 'path';
import { UserController } from './controllers/user.controller';
import { connectToDatabase, closeDatabase } from './utils/database';
import config from './config/config';

// Load proto file
const PROTO_PATH = path.resolve(__dirname, './proto/user.proto');

const packageDefinition = protoLoader.loadSync(PROTO_PATH, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});

const protoDescriptor = grpc.loadPackageDefinition(packageDefinition);
const userProto = protoDescriptor.user as any;

// Initialize controllers
const userController = new UserController();

async function startServer() {
  try {
    // Connect to MongoDB
    await connectToDatabase();

    // Create gRPC server
    const server = new grpc.Server();

    // Add user service
    server.addService(userProto.UserService.service, {
      register: userController.register.bind(userController),
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