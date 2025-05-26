import DeviceSession, { IDeviceSession } from '../models/device-session.model';

export interface DeviceInfo {
  deviceId: string;
  deviceOS: string;
}

export class DeviceSessionService {
  /**
   * Create or update device session for a user
   */
  async createOrUpdateSession(
    userId: string,
    deviceInfo: DeviceInfo
  ): Promise<IDeviceSession> {
    try {
      // Find existing session for this user and device
      let session = await DeviceSession.findOne({
        userId,
        deviceId: deviceInfo.deviceId,
      });

      if (session) {
        // Update existing session
        session.lastActivity = new Date();
        session.isActive = true;
        session.deviceOS = deviceInfo.deviceOS; // Update OS in case it changed
        await session.save();
      } else {
        // Create new session
        session = await DeviceSession.create({
          userId,
          deviceId: deviceInfo.deviceId,
          deviceOS: deviceInfo.deviceOS,
          lastActivity: new Date(),
          isActive: true,
        });
      }

      return session;
    } catch (error) {
      console.error('Error creating/updating device session:', error);
      throw error;
    }
  }

  /**
   * Get all active sessions for a user
   */
  async getUserActiveSessions(userId: string): Promise<IDeviceSession[]> {
    try {
      return await DeviceSession.find({
        userId,
        isActive: true,
      }).sort({ lastActivity: -1 });
    } catch (error) {
      console.error('Error fetching user active sessions:', error);
      throw error;
    }
  }

  /**
   * Deactivate a specific device session
   */
  async deactivateSession(userId: string, deviceId: string): Promise<boolean> {
    try {
      const result = await DeviceSession.updateOne(
        { userId, deviceId },
        { isActive: false }
      );
      return result.modifiedCount > 0;
    } catch (error) {
      console.error('Error deactivating session:', error);
      throw error;
    }
  }

  /**
   * Deactivate all sessions for a user (logout from all devices)
   */
  async deactivateAllUserSessions(userId: string): Promise<number> {
    try {
      const result = await DeviceSession.updateMany(
        { userId },
        { isActive: false }
      );
      return result.modifiedCount;
    } catch (error) {
      console.error('Error deactivating all user sessions:', error);
      throw error;
    }
  }

  /**
   * Clean up old inactive sessions (older than 30 days)
   */
  async cleanupOldSessions(): Promise<number> {
    try {
      const thirtyDaysAgo = new Date();
      thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);

      const result = await DeviceSession.deleteMany({
        isActive: false,
        lastActivity: { $lt: thirtyDaysAgo },
      });

      return result.deletedCount || 0;
    } catch (error) {
      console.error('Error cleaning up old sessions:', error);
      throw error;
    }
  }

  /**
   * Validate device info
   */
  validateDeviceInfo(deviceInfo: DeviceInfo): boolean {
    const validOS = ['iOS', 'Android', 'Web', 'Desktop'];
    return (
      Boolean(deviceInfo.deviceId) &&
      deviceInfo.deviceId.trim().length > 0 &&
      Boolean(deviceInfo.deviceOS) &&
      validOS.includes(deviceInfo.deviceOS)
    );
  }
} 