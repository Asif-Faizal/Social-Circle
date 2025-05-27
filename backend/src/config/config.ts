import dotenv from 'dotenv';
import path from 'path';
import fs from 'fs';

// Determine the absolute path to .env file
const envPath = path.resolve(process.cwd(), '.env');

// Check if .env exists and load it
if (fs.existsSync(envPath)) {
  console.log(`Loading environment variables from: ${envPath}`);
  dotenv.config({ path: envPath });
} else {
  console.warn(`Warning: .env file not found at ${envPath}`);
}

export default {
  // MongoDB connection string
  mongodbUrl: process.env.MONGODB_URL || 'mongodb+srv://socialcirclemessaging:WIYTxZ2IluAl0bEW@production.icyn4aj.mongodb.net/?retryWrites=true&w=majority&appName=Production',
  
  // JWT settings
  jwt: {
    secret: process.env.JWT_SECRET || 'default-secret-key',
    expiresIn: process.env.TOKEN_EXPIRATION || '1h',
    refreshTokenExpiresIn: process.env.REFRESH_TOKEN_EXPIRATION || '7d',
  },
  
  // Server settings
  port: parseInt(process.env.PORT || '5000', 10),

  // Email settings
  email: {
    host: process.env.EMAIL_HOST || 'smtp.gmail.com',
    port: parseInt(process.env.EMAIL_PORT || '587', 10),
    secure: process.env.EMAIL_SECURE === 'true',
    auth: {
      user: process.env.EMAIL_USER || 'socialcircle.messaging@gmail.com',
      pass: process.env.EMAIL_PASSWORD || '',
    },
    from: process.env.EMAIL_FROM || 'socialcircle.messaging@gmail.com',
  },

  // OTP settings
  otp: {
    length: 6,
    expiresIn: 10 * 60 * 1000, // 10 minutes in milliseconds
  },
}; 