# Social Circle

A full-stack social chat application built with Node.js/TypeScript backend and Flutter frontend, featuring real-time messaging, chat history, and comprehensive user management.

## 🚀 Features

### Core Functionality

- **Real-time Chat Messaging**: Instant messaging between users with live updates
- **Chat History**: Persistent message storage and retrieval for conversation continuity
- **User Authentication**: Secure login/registration with email OTP verification
- **Device Session Management**: Track and manage user sessions across multiple devices
- **Cross-platform Mobile App**: Flutter app supporting both Android and iOS

### Technical Features

- **gRPC Communication**: High-performance communication between services
- **JWT Authentication**: Secure token-based authentication
- **Firebase Integration**: Push notifications and cloud messaging
- **MongoDB Database**: Scalable document-based data storage
- **Email Services**: Automated OTP delivery and notifications

## 🏗️ Architecture

### Backend (`/backend`)

- **Framework**: Node.js with TypeScript and Express
- **Database**: MongoDB with Mongoose ODM
- **Communication**: gRPC for service-to-service communication
- **Authentication**: JWT tokens with refresh mechanism
- **Email**: Nodemailer for OTP and notification emails

#### Key Components

- **Chat Controller**: Handles message sending and chat history retrieval
- **User Controller**: Manages user registration, authentication, and profiles
- **Chat Service**: Core business logic for messaging and conversation management
- **Device Session Service**: Tracks user devices and active sessions
- **Auth Middleware**: JWT validation and route protection

### Frontend (`/frontend`)

- **Framework**: Flutter for cross-platform mobile development
- **State Management**: BLoC pattern for reactive state management
- **Architecture**: Clean Architecture with separation of concerns
- **Networking**: gRPC clients for backend communication
- **Local Storage**: Secure storage for user tokens and preferences

#### Key Features

- **Authentication Flows**: Login, registration, and OTP verification screens
- **Chat Interface**: Real-time messaging with message history
- **User Management**: Profile management and user discovery
- **Device Info**: Device tracking and session management

## 📁 Project Structure

```xml
Social-Circle/
├── backend/                 # Node.js TypeScript backend
│   ├── src/
│   │   ├── controllers/     # Route handlers
│   │   ├── models/         # MongoDB schemas
│   │   ├── services/       # Business logic
│   │   ├── routes/         # API routes
│   │   ├── middleware/     # Auth and validation
│   │   ├── proto/          # gRPC protocol definitions
│   │   └── utils/          # Database, JWT, email utilities
│   └── package.json
└── frontend/               # Flutter mobile app
    ├── lib/
    │   ├── core/           # Core utilities and configuration
    │   ├── feature/        # Feature-based modules
    │   │   ├── auth/       # Authentication functionality
    │   │   ├── chat/       # Chat and messaging
    │   │   ├── home/       # User management and discovery
    │   │   └── splash/     # App initialization
    │   └── main.dart
    └── pubspec.yaml
```

## 🛠️ Setup and Installation

### Prerequisites

- Node.js (v16 or higher)
- MongoDB (local or cloud instance)
- Flutter SDK
- Android Studio / Xcode (for mobile development)

### Backend Setup

1. **Navigate to backend directory:**

   ```bash
   cd backend
   ```

2. **Install dependencies:**

   ```bash
   npm install
   ```

3. **Environment Configuration:**
   Create a `.env` file with:

   ```env
   DATABASE_URL=mongodb://localhost:27017/social-circle
   JWT_SECRET=your-jwt-secret
   JWT_REFRESH_SECRET=your-refresh-secret
   EMAIL_USER=your-email@gmail.com
   EMAIL_PASS=your-app-password
   PORT=3000
   ```

4. **Start the server:**

   ```bash
   npm run dev
   ```

### Frontend Setup

1. **Navigate to frontend directory:**

   ```bash
   cd frontend
   ```

2. **Install Flutter dependencies:**

   ```bash
   flutter pub get
   ```

3. **Firebase Setup:**
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Configure Firebase project with Authentication and Cloud Messaging

4. **Generate code:**

   ```bash
   flutter packages pub run build_runner build
   ```

5. **Run the app:**

   ```bash
   flutter run
   ```

## 🔧 API Endpoints

### Chat Service

- `POST /api/chat/send` - Send a new message
- `GET /api/chat/history/:userId` - Retrieve chat history between users
- `GET /api/chat/conversations` - Get all user conversations

### User Service

- `POST /api/user/register` - User registration
- `POST /api/user/login` - User authentication
- `POST /api/user/verify-otp` - OTP verification
- `GET /api/user/profile` - Get user profile
- `GET /api/user/all` - Get all users (for chat discovery)

### Authentication

- `POST /api/auth/refresh` - Refresh JWT token
- `POST /api/auth/logout` - Logout and invalidate session

## 📱 Mobile App Features

### Authentication Flow

1. **Email Registration**: Users register with email address
2. **OTP Verification**: Email-based OTP for account verification
3. **Secure Login**: JWT-based authentication with refresh tokens
4. **Device Tracking**: Automatic device session management

### Chat Features

1. **Real-time Messaging**: Instant message delivery and receipt
2. **Chat History**: Access to complete conversation history
3. **User Discovery**: Browse and connect with other users
4. **Online Status**: See who's currently active
5. **Message Persistence**: All messages stored for future access

### User Experience

- **Clean UI**: Modern, intuitive interface design
- **Responsive**: Optimized for various screen sizes
- **Offline Support**: Local caching for better performance
- **Push Notifications**: Firebase-powered real-time notifications

## 🔐 Security Features

- **JWT Authentication**: Secure token-based authentication
- **Password Hashing**: Bcrypt for secure password storage
- **OTP Verification**: Email-based two-factor authentication
- **Device Session Tracking**: Monitor and manage user sessions
- **Input Validation**: Comprehensive request validation
- **CORS Protection**: Configured for secure cross-origin requests

## 🚀 Deployment

### Backend Deployment

- **Environment**: Configure production environment variables
- **Database**: Set up MongoDB Atlas or dedicated MongoDB instance
- **Email Service**: Configure production email service (SendGrid, SES, etc.)
- **Process Manager**: Use PM2 for production process management

### Frontend Deployment

- **Android**: Build APK/AAB for Google Play Store
- **iOS**: Build IPA for App Store distribution
- **Firebase**: Configure production Firebase project

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support and questions:

- Create an issue in this repository
- Contact the development team

---

**Social Circle** - Connecting people through seamless communication 💬✨
