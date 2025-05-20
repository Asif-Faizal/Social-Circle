import dotenv from 'dotenv';
import path from 'path';

// Load environment variables
dotenv.config({ path: path.resolve(__dirname, '../../.env') });

export default {
  // MongoDB connection string
  mongodbUrl: process.env.MONGODB_URL || 'mongodb://localhost:27017/social-circle',
  
  // JWT settings
  jwt: {
    secret: process.env.JWT_SECRET || 'default-secret-key',
    expiresIn: process.env.TOKEN_EXPIRATION || '1h',
  },
  
  // Server settings
  port: parseInt(process.env.PORT || '5000', 10),
}; 