# Bhukk Delivery Partner App

A Flutter-based delivery partner application for the Bhukk instant food and liquor delivery platform. This is a **frontend-only demo app** that showcases the complete delivery workflow using GetX for state management and routing with a modern, responsive UI.

## 🚀 Features

### Authentication & User Management
- **Phone Number + OTP Login**: Demo authentication using mobile number and OTP verification
- **Session Management**: Local state management with GetX
- **Account Management**: Complete profile management with edit capabilities
- **Modern UI**: Gradient app bars, animated buttons, and responsive design

### Navigation & Dashboard
- **Bottom Navigation**: Seamless navigation between Home, Dashboard, and Account screens
- **Dashboard Screen**: Modern statistics and performance metrics
- **Account Screen**: Profile management with settings and support options
- **Edit Account**: Comprehensive profile editing with form validation

### Home Screen & Order Management
- **Online/Offline Toggle**: Delivery partners can go online to receive orders or offline when unavailable
- **Live Order Notifications**: Real-time order popups when online with modern card design
- **Location Services**: GPS tracking and location permission handling
- **Order Acceptance/Rejection**: View order details and accept or reject orders with animated buttons

### Delivery Workflow
- **Pickup Navigation**: Google Maps integration for navigation to restaurants
- **Delivery Navigation**: Route guidance to customer locations
- **OTP Verification**: Secure pickup and delivery confirmation using OTP with modern UI
- **Payment & Completion**: QR code payment display and order completion tracking

## 📱 Screens

### Core Screens
1. **Login Screen** - Phone number input and OTP verification
2. **Home Screen** - Online/offline toggle and available orders
3. **Dashboard Screen** - Performance metrics and statistics
4. **Account Screen** - Profile management and settings

### Order Flow Screens
5. **Order Popup** - Order details with accept/reject options
6. **Pickup Map** - Navigation to restaurant location
7. **Pickup OTP** - Verification at restaurant
8. **Delivery Map** - Navigation to customer location
9. **Delivery OTP** - Verification at customer location
10. **Payment Screen** - QR code for customer payment
11. **Success Screen** - Order completion and earnings summary

### Account Management
12. **Edit Account Screen** - Comprehensive profile editing

## 🛠 Technical Stack

- **Framework**: Flutter 3.8.1+
- **State Management**: GetX with proper controller lifecycle management
- **Navigation**: GetX Routing with middleware and bindings
- **UI Components**: Custom reusable widgets with Material Design 3
- **Maps**: Google Maps Flutter
- **QR Code**: QR Flutter
- **Location**: Geolocator
- **Permissions**: Permission Handler
- **OTP Input**: Pin Code Fields
- **Form Validation**: Built-in Flutter form validation

## 📁 Project Structure

```
lib/
├── main.dart
├── app/
│   ├── routes/
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   ├── bindings/
│   │   ├── auth_binding.dart
│   │   ├── home_binding.dart
│   │   ├── order_binding.dart
│   │   └── account_binding.dart
│   ├── controllers/
│   │   ├── auth_controller.dart
│   │   ├── home_controller.dart
│   │   ├── order_controller.dart
│   │   └── account_controller.dart
│   ├── views/
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   └── otp_screen.dart
│   │   ├── home/
│   │   │   └── home_screen.dart
│   │   ├── dashboard/
│   │   │   └── dashboard_screen.dart
│   │   ├── account/
│   │   │   ├── account_screen.dart
│   │   │   └── edit_account_screen.dart
│   │   └── order/
│   │       ├── order_popup.dart
│   │       ├── pickup_map_screen.dart
│   │       ├── otp_pickup_screen.dart
│   │       ├── delivery_map_screen.dart
│   │       ├── otp_delivery_screen.dart
│   │       ├── payment_screen.dart
│   │       └── order_success_screen.dart
│   ├── data/
│   │   ├── models/
│   │   │   └── order_model.dart
│   │   └── services/
│   │       ├── auth_service.dart
│   │       ├── order_service.dart
│   │       └── location_service.dart
│   └── widgets/
│       ├── bottom_nav_bar.dart
│       ├── app_bar.dart
│       └── order_popup_card.dart
```

## 🎨 UI/UX Features

### Modern Design System
- **Material Design 3**: Latest Material Design implementation
- **Gradient App Bars**: Beautiful gradient backgrounds for all screens
- **Animated Buttons**: Smooth animations and hover effects
- **Card-Based Layout**: Modern card designs with shadows and rounded corners
- **Responsive Design**: Adapts to different screen sizes and orientations

### Interactive Elements
- **Loading States**: Proper loading indicators and skeleton screens
- **Error Handling**: User-friendly error messages and retry options
- **Success Feedback**: Visual confirmation for completed actions
- **Smooth Navigation**: Seamless screen transitions with GetX

### Accessibility
- **High Contrast**: Proper color contrast for readability
- **Touch Targets**: Adequate button sizes for mobile interaction
- **Screen Reader Support**: Proper semantic labels and descriptions

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed on your system:

- **Flutter SDK** 3.8.1 or higher
- **Dart SDK** 3.0.0 or higher
- **Git** for version control
- **Android Studio** or **VS Code** with Flutter extensions
- **Android SDK** (for Android development)
- **Xcode** (for iOS development, macOS only)

### 📥 Download & Setup

#### Method 1: Clone from Git Repository

1. **Open Terminal/Command Prompt**
   ```bash
   # Navigate to your desired directory
   cd /path/to/your/projects
   ```

2. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/bhukk-delivery-partner.git
   cd bhukk-delivery-partner
   ```

#### Method 2: Download ZIP File

1. **Download from GitHub**
   - Go to the repository page
   - Click the green "Code" button
   - Select "Download ZIP"
   - Extract the ZIP file to your desired location

2. **Open in Terminal/Command Prompt**
   ```bash
   cd /path/to/extracted/bhukk-delivery-partner
   ```

### 🔧 Installation Steps

1. **Install Flutter Dependencies**
   ```bash
   flutter pub get
   ```

2. **Verify Flutter Setup**
   ```bash
   flutter doctor
   ```
   This command will check if your Flutter installation is complete and show any missing dependencies.

3. **Configure Google Maps API Key** (Optional for demo)
   
   **For Android:**
   - Open `android/app/src/main/AndroidManifest.xml`
   - Add your Google Maps API key:
   ```xml
   <meta-data
     android:name="com.google.android.geo.API_KEY"
     android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
   ```

   **For iOS:**
   - Open `ios/Runner/AppDelegate.swift`
   - Add your Google Maps API key:
   ```swift
   GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY")
   ```

   **Note:** For demo purposes, the app will work without a Google Maps API key, but maps functionality will be limited.

### 📱 Running on Your Device

#### Android Device/Emulator

1. **Connect Android Device**
   - Enable Developer Options on your Android device
   - Enable USB Debugging
   - Connect via USB cable

2. **Or Start Android Emulator**
   ```bash
   # List available emulators
   flutter emulators
   
   # Start an emulator
   flutter emulators --launch <emulator_id>
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

#### iOS Device/Simulator (macOS only)

1. **Connect iOS Device**
   - Connect your iPhone via USB
   - Trust the computer on your device

2. **Or Start iOS Simulator**
   ```bash
   # Open iOS Simulator
   open -a Simulator
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

#### Web Browser

1. **Run for Web**
   ```bash
   flutter run -d chrome
   ```

### 🧪 Testing the App

Once the app is running, you can test the following features:

1. **Login with Demo Credentials**
   - Phone Number: Any 10-digit number (e.g., `1234567890`)
   - OTP: `123456`

2. **Test Order Flow**
   - Go online on the home screen
   - Accept incoming orders
   - Test pickup OTP: `1234` or `4321`
   - Test delivery OTP: `5678` or `8765`

3. **Explore Features**
   - Navigate between Home, Dashboard, and Account screens
   - Edit your profile in the Account section
   - Test the complete delivery workflow

### 🔍 Troubleshooting

#### Common Issues

1. **Flutter not found**
   ```bash
   # Add Flutter to PATH
   export PATH="$PATH:/path/to/flutter/bin"
   ```

2. **Dependencies not found**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Device not detected**
   ```bash
   # Check connected devices
   flutter devices
   
   # Restart ADB (Android)
   adb kill-server
   adb start-server
   ```

4. **Build errors**
   ```bash
   # Clean and rebuild
   flutter clean
   flutter pub get
   flutter run
   ```

#### Platform-Specific Issues

**Android:**
- Ensure Android SDK is properly installed
- Check that ANDROID_HOME environment variable is set
- Verify that target SDK version is compatible

**iOS:**
- Ensure Xcode is installed and updated
- Accept Xcode license: `sudo xcodebuild -license accept`
- Install iOS Simulator if not present

**Web:**
- Ensure Chrome is installed
- Check that web support is enabled: `flutter config --enable-web`

### 📱 Building for Production

#### Android APK
```bash
flutter build apk --release
```
The APK will be created at: `build/app/outputs/flutter-apk/app-release.apk`

#### Android App Bundle
```bash
flutter build appbundle --release
```
The AAB will be created at: `build/app/outputs/bundle/release/app-release.aab`

#### iOS
```bash
flutter build ios --release
```
Open the generated `.xcworkspace` file in Xcode to archive and distribute.

### 🎯 Quick Start Commands

```bash
# Clone and setup
git clone https://github.com/yourusername/bhukk-delivery-partner.git
cd bhukk-delivery-partner
flutter pub get

# Run on connected device
flutter run

# Run on specific device
flutter run -d <device_id>

# Run in debug mode
flutter run --debug

# Run in release mode
flutter run --release
```

## 🧪 Demo Mode

The app includes demo mode for testing purposes:

- **Login OTP**: Use `123456` for authentication
- **Pickup OTP**: Use `1234` or `4321` for restaurant verification
- **Delivery OTP**: Use `5678` or `8765` for customer verification

## 🔧 Architecture & State Management

### GetX Implementation
- **Controllers**: Properly managed with lifecycle and dependency injection
- **Bindings**: Automatic controller initialization and cleanup
- **Reactive Programming**: Real-time UI updates using GetX observables
- **Route Management**: Centralized routing with middleware support

### State Management Features
- **AccountController**: Manages user profile and account-related state
- **AuthController**: Handles authentication and session management
- **HomeController**: Manages online/offline status and order notifications
- **OrderController**: Handles order flow and delivery process

### Error Handling & Resilience
- **Controller Fallbacks**: Automatic controller initialization if not found
- **Navigation Error Handling**: Graceful handling of routing errors
- **Form Validation**: Comprehensive input validation with user feedback
- **Loading States**: Proper loading indicators throughout the app

## 🔒 Permissions

The app requires the following permissions:

- **Location**: For GPS tracking and navigation
- **Internet**: For Google Maps functionality
- **Camera**: For QR code scanning (optional)

## 📱 Platform Support

- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 11.0+
- **Web**: Chrome, Firefox, Safari, Edge

## 🚀 Deployment

### Android

1. **Build APK**
   ```bash
   flutter build apk --release
   ```

2. **Build App Bundle**
   ```bash
   flutter build appbundle --release
   ```

### iOS

1. **Build for iOS**
   ```bash
   flutter build ios --release
   ```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation for common issues

---

**Note**: This is a demo application showcasing the delivery partner workflow. For production use, integrate with actual backend services and implement proper security measures.
