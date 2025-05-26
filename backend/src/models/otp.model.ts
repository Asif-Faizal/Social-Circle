import mongoose, { Document, Schema } from 'mongoose';

export interface IOTP extends Document {
  email: string;
  otp: string;
  createdAt: Date;
  expiresAt: Date;
  isVerified: boolean;
  deviceId: string;
  deviceOS: string;
}

const OTPSchema: Schema = new Schema(
  {
    email: {
      type: String,
      required: true,
      trim: true,
      lowercase: true,
    },
    otp: {
      type: String,
      required: true,
    },
    createdAt: {
      type: Date,
      default: Date.now,
    },
    expiresAt: {
      type: Date,
      required: true,
    },
    isVerified: {
      type: Boolean,
      default: false,
    },
    deviceId: {
      type: String,
      required: true,
      trim: true,
    },
    deviceOS: {
      type: String,
      required: true,
      trim: true,
      enum: ['iOS', 'Android', 'Web', 'Desktop'],
    },
  },
  {
    timestamps: true,
  }
);

// Automatically delete expired OTPs
OTPSchema.index({ expiresAt: 1 }, { expireAfterSeconds: 0 });

export default mongoose.model<IOTP>('OTP', OTPSchema); 