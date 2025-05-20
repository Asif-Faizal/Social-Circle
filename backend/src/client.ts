import * as grpc from '@grpc/grpc-js';
import * as protoLoader from '@grpc/proto-loader';
import path from 'path';
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

// Create gRPC client
const client = new userProto.UserService(
  `localhost:${config.port}`,
  grpc.credentials.createInsecure()
);

// Example user for registration
const user = {
  username: 'testuser',
  email: 'test@example.com',
  password: 'password123',
};

// Test register user
client.register(user, (error: any, response: any) => {
  if (error) {
    console.error('Error:', error);
    return;
  }

  console.log('Response:', response);
  
  if (response.success) {
    console.log('User registered successfully');
    console.log('Token:', response.token);
    console.log('User:', response.user);
  } else {
    console.log('Registration failed:', response.message);
  }
}); 