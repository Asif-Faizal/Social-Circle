import mongoose, { Document, Schema } from 'mongoose';

export interface IDeviceSession extends Document {
  userId: string;
  deviceId: string;
  deviceOS: string;
  lastActivity: Date;
  isActive: boolean;
}

const DeviceSessionSchema: Schema = new Schema(
  {
    userId: {
      type: Schema.Types.ObjectId,
      ref: 'User',
      required: true,
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
    lastActivity: {
      type: Date,
      default: Date.now,
    },
    isActive: {
      type: Boolean,
      default: true,
    },
  },
  {
    timestamps: true,
  }
);

// Compound index for efficient queries
DeviceSessionSchema.index({ userId: 1, deviceId: 1 }, { unique: true });
DeviceSessionSchema.index({ lastActivity: 1 });

export default mongoose.model<IDeviceSession>('DeviceSession', DeviceSessionSchema); 