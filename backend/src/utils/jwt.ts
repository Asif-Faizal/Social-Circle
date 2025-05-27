import jwt, { SignOptions, Secret, JwtPayload } from 'jsonwebtoken';
import config from '../config/config';
import { IUser } from '../models/user.model';
import { Types } from 'mongoose';

interface TokenPayload extends JwtPayload {
  id: string;
  username: string;
  email: string;
  type: 'access' | 'refresh';
}

type StringValue = {
  toString(): string;
};

// Generate access token
export const generateAccessToken = (user: IUser): string => {
  const payload: TokenPayload = {
    id: (user._id as Types.ObjectId).toString(),
    username: user.username,
    email: user.email,
    type: 'access'
  };

  const secret = config.jwt.secret as Secret;
  // @ts-ignore: Type issues with jsonwebtoken types
  return jwt.sign(payload, secret, {
    algorithm: 'HS256',
    expiresIn: config.jwt.expiresIn
  });
};

// Generate refresh token
export const generateRefreshToken = (user: IUser): string => {
  const payload: TokenPayload = {
    id: (user._id as Types.ObjectId).toString(),
    username: user.username,
    email: user.email,
    type: 'refresh'
  };

  const secret = config.jwt.secret as Secret;
  // @ts-ignore: Type issues with jsonwebtoken types
  return jwt.sign(payload, secret, {
    algorithm: 'HS256',
    expiresIn: config.jwt.refreshTokenExpiresIn
  });
};

// Verify token
export const verifyToken = (token: string): TokenPayload => {
  try {
    const secret = config.jwt.secret as Secret;
    const decoded = jwt.verify(token, secret, {
      algorithms: ['HS256']
    }) as TokenPayload;
    return decoded;
  } catch (error) {
    throw new Error('Invalid token');
  }
}; 