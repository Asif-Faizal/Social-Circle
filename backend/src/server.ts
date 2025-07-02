import * as grpc from '@grpc/grpc-js';
import * as protoLoader from '@grpc/proto-loader';
import { ReflectionService } from '@grpc/reflection';
import path from 'path';
import { connectToDatabase, closeDatabase } from './utils/database';
import config from './config/config';
import { userRoutes } from './routes/user.routes';
import { chatRoutes } from './routes/chat.routes';

const PROTO_DIR = path.resolve(__dirname, './proto');

const PROTO_PATHS = [
  path.join(PROTO_DIR, 'user.proto'),
  path.join(PROTO_DIR, 'chat.proto'),
];

console.log('Loading proto files from:', PROTO_PATHS);

const packageDefinition = protoLoader.loadSync(PROTO_PATHS, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
  json: true,
  includeDirs: [PROTO_DIR],
});

const protoDescriptor = grpc.loadPackageDefinition(packageDefinition);
const userProto = protoDescriptor.user as any;
const chatProto = protoDescriptor.chat as any;

// Debug the service definitions
console.log('Available services in userProto:', Object.keys(userProto));
if (userProto.UserService) {
  console.log('Available methods in UserService:', 
    Object.keys(userProto.UserService.service));
}
console.log('Available services in chatProto:', Object.keys(chatProto));
if (chatProto.ChatService) {
  console.log('Available methods in ChatService:', 
    Object.keys(chatProto.ChatService.service));
}

async function startServer() {
  try {
    // Connect to MongoDB
    await connectToDatabase();

    // Create gRPC server
    const server = new grpc.Server();

    // Add user service
    server.addService(userProto.UserService.service, {
      Register: userRoutes.register,
      Login: userRoutes.login,
      SendOTP: userRoutes.sendOTP,
      VerifyOTP: userRoutes.verifyOTP,
      GetActiveSessions: userRoutes.getActiveSessions,
      LogoutDevice: userRoutes.logoutDevice,
      LogoutAllDevices: userRoutes.logoutAllDevices,
      RefreshToken: userRoutes.refreshToken,
      GetUserInfo: userRoutes.getUserInfo,
      CheckEmail: userRoutes.checkEmail,
      GetAllUsers: userRoutes.getAllUsers
    });

    // Add chat service
    server.addService(chatProto.ChatService.service, {
      GetChatHistory: chatRoutes.getChatHistory,
      Converse: chatRoutes.converse,
    });

    // Add reflection service
    const reflectionService = new ReflectionService(packageDefinition);
    reflectionService.addToServer(server);

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