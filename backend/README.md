# Social Circle Backend

A gRPC-based backend for the Social Circle application with user registration and JWT authentication.

## Features

- User registration with JWT authentication
- Secure password hashing with bcrypt
- MongoDB database integration
- Built with TypeScript and SOLID principles

## Project Structure

The project follows SOLID principles with a clear separation of concerns:

- `controllers`: Handle gRPC requests and responses
- `services`: Contain business logic
- `models`: Define MongoDB schemas
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

Run the server in development mode:

```bash
npm run dev
```

Test with the client:

```bash
npm run client
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

## API Reference

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
