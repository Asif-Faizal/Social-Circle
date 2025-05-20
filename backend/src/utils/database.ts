import mongoose from 'mongoose';
import config from '../config/config';

// Function to connect to MongoDB
export const connectToDatabase = async (): Promise<void> => {
  try {
    await mongoose.connect(config.mongodbUrl);
    console.log('Connected to MongoDB database');
  } catch (error) {
    console.error('Error connecting to MongoDB:', error);
    process.exit(1);
  }
};

// Function to close MongoDB connection
export const closeDatabase = async (): Promise<void> => {
  try {
    await mongoose.connection.close();
    console.log('Closed MongoDB connection');
  } catch (error) {
    console.error('Error closing MongoDB connection:', error);
  }
}; 