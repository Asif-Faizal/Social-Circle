# Social Circle Backend

A gRPC-based backend for the Social Circle application with user registration and JWT authentication.

## Features

- User registration with JWT authentication
- Secure password hashing with bcrypt
- MongoDB database integration
- Built with TypeScript and SOLID principles
- Structured gRPC routes

## Project Structure

The project follows SOLID principles with a clear separation of concerns:

- `controllers`: Handle gRPC business logic
- `services`: Contain core business logic and data operations
- `models`: Define MongoDB schemas
- `routes`: Manage gRPC service method routing
- `proto`: gRPC protocol buffer definitions
- `config`: Application configuration
- `utils`: Utility functions for database, JWT, etc.

## Getting Started

### Prerequisites

- Node.js (v14+)
- MongoDB (local or Atlas)

### Installation

1. Install dependencies:

   ```bash
   npm install
   ```

2. Create a `.env` file in the root directory with the following variables:

   ```bash
   MONGODB_URL=mongodb+srv://admin:admin-social-circle@social-circle.oiafgnc.mongodb.net/?retryWrites=true&w=majority&appName=Social-Circle
   JWT_SECRET=social-circle-jwt-secret
   TOKEN_EXPIRATION=1h
   PORT=5000
   ```

### Development

Start the server:

```bash
npm run server
```

Run the interactive client:

```bash
npm run client
```

Run both server and client together:

```bash
npm run dev
```

### Production

Build the project:

```bash
npm run build
```

Start the server:

```bash
npm start
```

## gRPC Services

### User Service

**Register User**

- Method: `register`
- Request:
  - `username`: string
  - `email`: string
  - `password`: string
- Response:
  - `success`: boolean
  - `message`: string
  - `token`: string (JWT token)
  - `user`: User object with id, username, and email

## Using the client

The client provides an interactive menu to test gRPC services:

1. Start the server: `npm run server`
2. Start the client: `npm run client`
3. Follow the prompts to register a user

## Using gRPC client

There are two ways to interact with the gRPC services:

### 1. Interactive Client

The client provides an interactive menu to test gRPC services:

1. Start the server: `npm run server`
2. Start the client: `npm run client`
3. Follow the prompts to register a user

### 2. Using grpcurl

You can also test the API using grpcurl, a command-line tool for interacting with gRPC services:

1. Install grpcurl:
   ```bash
   # macOS
   brew install grpcurl

   # Linux
   sudo apt-get install -y grpcurl
   ```

2. Register a user (using the proto file directly):
   ```bash
   grpcurl -plaintext -proto src/proto/user.proto -d '{"username": "newuser123", "email": "newuser@example.com", "password": "password123"}' localhost:5000 user.UserService/Register
   ```

   Example successful response:
   ```json
   {
     "success": true,
     "message": "User registered successfully",
     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
     "user": {
       "id": "682c5d25fef167e8823a0969",
       "username": "newuser123",
       "email": "newuser@example.com"
     }
   }
   ```

The above command:
- Uses the `-proto` flag to specify the proto file
- Provides the request data in the `-d` flag
- Specifies the service and method to call: `user.UserService/Register`
