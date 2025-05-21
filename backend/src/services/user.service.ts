import User, { IUser } from '../models/user.model';
import { generateToken } from '../utils/jwt';
import { generateOTP, saveOTP, sendOTPEmail, verifyOTP } from '../utils/email';

export interface RegisterUserInput {
  username: string;
  email: string;
  password: string;
}

export interface LoginUserInput {
  email: string;
  password: string;
}

export interface SendOTPInput {
  email: string;
}

export interface VerifyOTPInput {
  email: string;
  otp: string;
}

export interface UserOutput {
  success: boolean;
  message: string;
  token?: string;
  user?: {
    id: string;
    username: string;
    email: string;
  };
}

export interface OTPOutput {
  success: boolean;
  message: string;
}

export class UserService {
  async registerUser(input: RegisterUserInput): Promise<UserOutput> {
    try {
      // Check if user already exists
      const existingUser = await User.findOne({
        $or: [{ username: input.username }, { email: input.email }],
      });

      if (existingUser) {
        return {
          success: false,
          message: 'Username or email already exists',
        };
      }

      // Create new user
      const user = await User.create({
        username: input.username,
        email: input.email,
        password: input.password,
      });

      // Generate JWT token
      const token = generateToken(user);

      return {
        success: true,
        message: 'User registered successfully',
        token,
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
        },
      };
    } catch (error) {
      console.error('Error registering user:', error);
      return {
        success: false,
        message: 'Error registering user',
      };
    }
  }

  async loginUser(input: LoginUserInput): Promise<UserOutput> {
    try {
      // Find user by email
      const user = await User.findOne({ email: input.email });

      // Check if user exists
      if (!user) {
        return {
          success: false,
          message: 'Invalid email or password',
        };
      }

      // Verify password
      const isPasswordValid = await user.comparePassword(input.password);
      
      if (!isPasswordValid) {
        return {
          success: false,
          message: 'Invalid email or password',
        };
      }

      // Generate JWT token
      const token = generateToken(user);

      return {
        success: true,
        message: 'Login successful',
        token,
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
        },
      };
    } catch (error) {
      console.error('Error during login:', error);
      return {
        success: false,
        message: 'Error during login',
      };
    }
  }

  async sendOTP(input: SendOTPInput): Promise<OTPOutput> {
    try {
      // Generate OTP
      const otp = generateOTP();

      // Save OTP to database
      await saveOTP(input.email, otp);

      // Send OTP via email
      const emailSent = await sendOTPEmail(input.email, otp);

      if (!emailSent) {
        return {
          success: false,
          message: 'Failed to send OTP email',
        };
      }

      return {
        success: true,
        message: 'OTP sent successfully',
      };
    } catch (error) {
      console.error('Error sending OTP:', error);
      return {
        success: false,
        message: 'Error sending OTP',
      };
    }
  }

  async verifyOTP(input: VerifyOTPInput): Promise<OTPOutput> {
    try {
      // Verify OTP
      const isValid = await verifyOTP(input.email, input.otp);

      if (!isValid) {
        return {
          success: false,
          message: 'Invalid or expired OTP',
        };
      }

      return {
        success: true,
        message: 'OTP verified successfully',
      };
    } catch (error) {
      console.error('Error verifying OTP:', error);
      return {
        success: false,
        message: 'Error verifying OTP',
      };
    }
  }
} 