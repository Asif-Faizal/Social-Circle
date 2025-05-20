import jwt from 'jsonwebtoken';
import config from '../config/config';
import { IUser } from '../models/user.model';

// Generate JWT token
export const generateToken = (user: IUser): string => {
  const payload = {
    id: user._id,
    username: user.username,
    email: user.email,
  };

  // Use type assertion to bypass TypeScript's type checking for this problematic case
  // @ts-ignore
  return jwt.sign(payload, config.jwt.secret, { 
    expiresIn: config.jwt.expiresIn 
  });
};

// Verify JWT token
export const verifyToken = (token: string): any => {
  try {
    // @ts-ignore
    return jwt.verify(token, config.jwt.secret);
  } catch (error) {
    throw new Error('Invalid token');
  }
}; 