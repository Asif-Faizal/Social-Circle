import nodemailer from 'nodemailer';
import config from '../config/config';
import otpGenerator from 'otp-generator';
import OTP from '../models/otp.model';
import { DeviceInfo } from '../services/device-session.service';

// Create nodemailer transporter
const transporter = nodemailer.createTransport({
  host: config.email.host,
  port: config.email.port,
  secure: config.email.secure,
  auth: {
    user: config.email.auth.user,
    pass: config.email.auth.pass,
  },
});

// Generate a new OTP
export const generateOTP = (): string => {
  return otpGenerator.generate(config.otp.length, {
    upperCaseAlphabets: false,
    specialChars: false,
    lowerCaseAlphabets: false,
    digits: true,
  });
};

// Save OTP to database
export const saveOTP = async (
  email: string,
  otp: string,
  deviceInfo: DeviceInfo
): Promise<void> => {
  // Delete any existing OTPs for this email and device
  await OTP.deleteMany({ 
    email, 
    deviceId: deviceInfo.deviceId 
  });

  // Calculate expiration time
  const expiresAt = new Date();
  expiresAt.setTime(expiresAt.getTime() + config.otp.expiresIn);

  // Create and save new OTP
  await OTP.create({
    email,
    otp,
    expiresAt,
    deviceId: deviceInfo.deviceId,
    deviceOS: deviceInfo.deviceOS,
  });
};

// Send OTP via email
export const sendOTPEmail = async (
  email: string,
  otp: string
): Promise<boolean> => {
  try {
    const mailOptions = {
      from: config.email.from,
      to: email,
      subject: 'Social Circle - Your Verification Code',
      html: `
        <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
          <h2 style="color: #FF641A;">Social Circle Verification</h2>
          <p>Hello,</p>
          <p>Your verification code is:</p>
          <div style="background-color: #f4f4f4; padding: 15px; text-align: center; font-size: 24px; font-weight: bold; letter-spacing: 5px;">
            ${otp}
          </div>
          <p>This code will expire in 10 minutes.</p>
          <p>If you didn't request this code, please ignore this email.</p>
          <p>Thank you,<br>The Social Circle Team</p>
        </div>
      `,
    };

    await transporter.sendMail(mailOptions);
    return true;
  } catch (error) {
    console.error('Error sending email:', error);
    return false;
  }
};

// Verify OTP
export const verifyOTP = async (
  email: string,
  otp: string,
  deviceInfo: DeviceInfo
): Promise<boolean> => {
  try {
    // Find the OTP record for the specific email, OTP, and device
    const otpRecord = await OTP.findOne({
      email,
      otp,
      deviceId: deviceInfo.deviceId,
      expiresAt: { $gt: new Date() }, // Not expired
      isVerified: false, // Not already used
    });

    if (!otpRecord) {
      return false;
    }

    // Mark as verified
    otpRecord.isVerified = true;
    await otpRecord.save();

    return true;
  } catch (error) {
    console.error('Error verifying OTP:', error);
    return false;
  }
}; 