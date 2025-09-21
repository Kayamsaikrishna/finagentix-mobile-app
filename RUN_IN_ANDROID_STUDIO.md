# How to Run Fin-Agentix Flutter App in Android Studio

## Prerequisites

1. Android Studio installed with Flutter plugin
2. Flutter SDK properly configured
3. Android Emulator or physical device connected

## Steps to Run the App

### 1. Open the Project in Android Studio

1. Launch Android Studio
2. Select **File** → **Open** (or **Open an existing Android Studio project**)
3. Navigate to:
   ```
   D:\KAYAM_SAI_KRISHNA\dem\secure-web-demo\finagentix_flutter_app\finagentix_flutter
   ```
4. Select the folder and click **OK**

### 2. Wait for Project Sync

- Android Studio will sync the project and download any necessary dependencies
- This may take a few minutes for the first time

### 3. Configure NDK (Already Fixed)

The NDK issue has been resolved by:
1. Updating the `local.properties` file to point to a working NDK version:
   ```
   ndk.dir=C\:\\Users\\kayam_drhfn9o\\AppData\\Local\\Android\\sdk\\ndk\\29.0.14033849
   ```
2. Updating the `android/app/build.gradle.kts` file to explicitly set the NDK version:
   ```kotlin
   ndkVersion = "29.0.14033849"
   ```

### 4. Select Target Device

1. In the toolbar, find the device selector dropdown
2. Choose either:
   - An available emulator
   - A connected physical device
   - Create a new emulator if none are available

### 5. Run the Application

1. Click the **Run** button (green play icon) in the toolbar
2. Or use **Run** → **Run 'main.dart'** from the menu

## Troubleshooting

### If You Still Encounter NDK Issues

1. Open Android Studio
2. Go to **File** → **Settings** (or **Android Studio** → **Preferences** on macOS)
3. Navigate to **Appearance & Behavior** → **System Settings** → **Android SDK**
4. Click on the **SDK Tools** tab
5. Check **NDK (Side by side)** and click **Apply**
6. If you have multiple NDK versions, try using version **29.0.14033849**

### If the App Doesn't Build

1. In Android Studio, go to **Build** → **Clean Project**
2. After cleaning, go to **Build** → **Rebuild Project**
3. Try running the app again

### If You Get Flutter Plugin Issues

1. Go to **File** → **Settings** → **Plugins**
2. Make sure the Flutter plugin is installed and enabled
3. Restart Android Studio if you made changes

## Project Structure

The app follows a clean architecture:

```
lib/
├── main.dart                 # Entry point
├── models/                   # Data models
│   ├── language.dart
│   └── loan_sector.dart
├── providers/                # State management
│   └── app_provider.dart
├── screens/                  # UI screens
│   ├── splash_screen.dart
│   ├── language_selection_screen.dart
│   ├── app_selection_screen.dart
│   ├── user_home_screen.dart
│   ├── admin_home_screen.dart
│   └── chatbot_screen.dart
├── services/                 # Business logic
│   ├── translation_service.dart
│   └── tts_service.dart
assets/
├── images/                   # Image assets
└── translations/             # Translation files (12 languages)
```

## Features Included

1. **Splash Screen** - Initial loading screen with logo
2. **Multi-language Support** - 12 Indian languages
3. **Text-to-Speech** - Voice welcome in selected language
4. **App Selection** - Choose between User or Admin application
5. **Tutorial Bot** - Toggle functionality for guided assistance
6. **Chatbot Integration** - Complete chat interface throughout the app
7. **User Dashboard** - Loan sectors with detailed information
8. **Admin Dashboard** - Statistics and management features

## Expected Behavior

When you run the app, you should see:

1. Splash screen with Fin-Agentix logo
2. Language selection screen with 12 Indian languages
3. Voice welcome message in the selected language
4. App selection between User and Admin applications
5. Respective dashboards with all features implemented

The app is completely ready for testing and demonstration as requested.

## Alternative Command Line Approach

If you prefer to use the command line, try these steps:

1. Navigate to the project directory:
   ```
   cd /d "D:\KAYAM_SAI_KRISHNA\dem\secure-web-demo\finagentix_flutter_app\finagentix_flutter"
   ```

2. Clean the project:
   ```
   flutter clean
   ```

3. Get dependencies:
   ```
   flutter pub get
   ```

4. Run the app:
   ```
   flutter run
   ```

The app is now ready for testing and demonstration exactly as you requested! All code analysis issues have been resolved, and the NDK configuration problem has been fixed.