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
      showMenu();
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
      showMenu();
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

// Function to send OTP
function sendOTP(email: string) {
  const data = { email };
  
  console.log(`Sending OTP to: ${email}`);
  
  client.sendOTP(data, (error: any, response: any) => {
    if (error) {
      console.error('Error:', error);
      showMenu();
      return;
    }

    console.log('Response:', response);
    
    if (response.success) {
      console.log('OTP sent successfully');
      promptVerifyOTP(email);
    } else {
      console.log('Failed to send OTP:', response.message);
      showMenu();
    }
  });
}

// Function to verify OTP
function verifyOTP(email: string, otp: string) {
  const data = { email, otp };
  
  console.log(`Verifying OTP for: ${email}`);
  
  client.verifyOTP(data, (error: any, response: any) => {
    if (error) {
      console.error('Error:', error);
      showMenu();
      return;
    }

    console.log('Response:', response);
    
    if (response.success) {
      console.log('OTP verified successfully');
    } else {
      console.log('OTP verification failed:', response.message);
    }
    
    showMenu();
  });
}

// Main menu
function showMenu() {
  console.log('\n--- gRPC Client Menu ---');
  console.log('1. Register a new user');
  console.log('2. Login to existing account');
  console.log('3. Send OTP email');
  console.log('4. Verify OTP');
  console.log('0. Exit');
  
  rl.question('Select an option: ', (option) => {
    switch (option) {
      case '1':
        promptRegisterUser();
        break;
      case '2':
        promptLoginUser();
        break;
      case '3':
        promptSendOTP();
        break;
      case '4':
        promptVerifyOTPWithEmail();
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

// Prompt for sending OTP
function promptSendOTP() {
  rl.question('Enter email: ', (email) => {
    sendOTP(email);
  });
}

// Prompt for verifying OTP with email
function promptVerifyOTPWithEmail() {
  rl.question('Enter email: ', (email) => {
    promptVerifyOTP(email);
  });
}

// Prompt for verifying OTP
function promptVerifyOTP(email: string) {
  rl.question('Enter OTP received in email: ', (otp) => {
    verifyOTP(email, otp);
  });
}

// Start the client
console.log('gRPC Client Started');
showMenu(); 