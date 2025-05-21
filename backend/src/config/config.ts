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
  mongodbUrl: process.env.MONGODB_URL || 'fallback-connection-string',
  
  // JWT settings
  jwt: {
    secret: process.env.JWT_SECRET || 'default-secret-key',
    expiresIn: process.env.TOKEN_EXPIRATION || '1h',
  },
  
  // Server settings
  port: parseInt(process.env.PORT || '5000', 10),
}; 