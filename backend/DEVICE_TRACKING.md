# Device Tracking Implementation

This document describes the device tracking functionality implemented in the Social Circle backend API.

## Overview

All authentication and OTP-related operations now require device identification to track user sessions across different devices. This enables features like:

- Multi-device session management
- Device-specific logout
- Security monitoring
- Session activity tracking

## Required Fields

All API requests now require two additional fields:

- `device_id`: Unique identifier for the device (e.g., UUID generated by the client)
- `device_os`: Operating system of the device (`iOS`, `Android`, `Web`, or `Desktop`)

## Updated APIs

### 1. Register User

**Request:**

```proto
message RegisterRequest {
  string username = 1;
  string email = 2;
  string password = 3;
  string device_id = 4;
  string device_os = 5;
}
```

**Functionality:**

- Creates user account
- Establishes initial device session
- Returns JWT token for authentication

### 2. Login User

**Request:**

```proto
message LoginRequest {
  string email = 1;
  string password = 2;
  string device_id = 3;
  string device_os = 4;
}
```

**Functionality:**

- Authenticates user credentials
- Creates or updates device session
- Returns JWT token for authentication

### 3. Send OTP

**Request:**

```proto
message SendOTPRequest {
  string email = 1;
  string device_id = 2;
  string device_os = 3;
}
```

**Functionality:**

- Generates and sends OTP via email
- Associates OTP with specific device
- Validates device information

### 4. Verify OTP

**Request:**

```proto
message VerifyOTPRequest {
  string email = 1;
  string otp = 2;
  string device_id = 3;
  string device_os = 4;
}
```

**Functionality:**

- Verifies OTP code
- Ensures OTP was requested from the same device
- Marks OTP as used

## New Device Management APIs

### 5. Get Active Sessions

**Request:**

```proto
message GetActiveSessionsRequest {
  string user_id = 1;
}
```

**Response:**

```proto
message GetActiveSessionsResponse {
  bool success = 1;
  string message = 2;
  repeated DeviceSession sessions = 3;
}
```

**Functionality:**

- Returns all active sessions for a user
- Shows device information and last activity

### 6. Logout Device

**Request:**

```proto
message LogoutDeviceRequest {
  string user_id = 1;
  string device_id = 2;
}
```

**Functionality:**

- Deactivates session for specific device
- Invalidates device-specific tokens

### 7. Logout All Devices

**Request:**

```proto
message LogoutAllDevicesRequest {
  string user_id = 1;
}
```

**Functionality:**

- Deactivates all sessions for a user
- Returns count of logged out devices

## Data Models

### DeviceSession

- `userId`: Reference to user
- `deviceId`: Unique device identifier
- `deviceOS`: Operating system type
- `lastActivity`: Timestamp of last API call
- `isActive`: Session status
- `createdAt`: Session creation timestamp
- `updatedAt`: Last update timestamp

### OTP (Updated)

- `email`: User email
- `otp`: Verification code
- `deviceId`: Device that requested OTP
- `deviceOS`: Device operating system
- `expiresAt`: OTP expiration time
- `isVerified`: Verification status

## Security Features

1. **Device Validation**: All requests validate device information format
2. **Session Isolation**: OTPs can only be verified from the requesting device
3. **Activity Tracking**: Last activity timestamps for monitoring
4. **Automatic Cleanup**: Old inactive sessions are automatically removed
5. **Concurrent Sessions**: Users can have multiple active sessions

## Error Handling

- Invalid device information returns appropriate error messages
- Missing device fields result in validation errors
- Device mismatch for OTP verification fails gracefully

## Usage Examples

### Frontend Implementation

```typescript
// Generate unique device ID (store in device storage)
const deviceId = generateUUID();
const deviceOS = Platform.OS; // 'ios' | 'android' | 'web'

// Register with device info
const registerRequest = {
  username: 'john_doe',
  email: 'john@example.com',
  password: 'password123',
  device_id: deviceId,
  device_os: deviceOS
};

// Send OTP with device info
const otpRequest = {
  email: 'john@example.com',
  device_id: deviceId,
  device_os: deviceOS
};
```

## Migration Notes

- Existing users will need to provide device information on next login
- Old OTP records without device info will be cleaned up
- Device sessions are created retroactively for existing active users
