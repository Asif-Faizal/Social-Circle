import * as grpc from '@grpc/grpc-js';
import * as protoLoader from '@grpc/proto-loader';
import path from 'path';
import config from './config/config';
import readline from 'readline';

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

// Create readline interface for user input
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Function to register a user
function registerUser(username: string, email: string, password: string) {
  const userData = { username, email, password };
  
  console.log(`Registering user: ${username}, ${email}`);
  
  client.register(userData, (error: any, response: any) => {
    if (error) {
      console.error('Error:', error);
      rl.close();
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
    
    showMenu();
  });
}

// Function to login a user
function loginUser(email: string, password: string) {
  const userData = { email, password };
  
  console.log(`Logging in user: ${email}`);
  
  client.login(userData, (error: any, response: any) => {
    if (error) {
      console.error('Error:', error);
      rl.close();
      return;
    }

    console.log('Response:', response);
    
    if (response.success) {
      console.log('Login successful');
      console.log('Token:', response.token);
      console.log('User:', response.user);
    } else {
      console.log('Login failed:', response.message);
    }
    
    showMenu();
  });
}

// Main menu
function showMenu() {
  console.log('\n--- gRPC Client Menu ---');
  console.log('1. Register a new user');
  console.log('2. Login to existing account');
  console.log('0. Exit');
  
  rl.question('Select an option: ', (option) => {
    switch (option) {
      case '1':
        promptRegisterUser();
        break;
      case '2':
        promptLoginUser();
        break;
      case '0':
        console.log('Exiting...');
        rl.close();
        break;
      default:
        console.log('Invalid option');
        showMenu();
        break;
    }
  });
}

// Prompt for user registration
function promptRegisterUser() {
  rl.question('Enter username: ', (username) => {
    rl.question('Enter email: ', (email) => {
      rl.question('Enter password: ', (password) => {
        registerUser(username, email, password);
      });
    });
  });
}

// Prompt for user login
function promptLoginUser() {
  rl.question('Enter email: ', (email) => {
    rl.question('Enter password: ', (password) => {
      loginUser(email, password);
    });
  });
}

// Start the client
console.log('gRPC Client Started');
showMenu(); 