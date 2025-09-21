@echo off
echo Optimized APK Build Script for Fin-Agentix Flutter App
echo =====================================================
echo.
echo This script will attempt to build the APK with reduced memory usage.
echo.
echo Clearing build cache...
flutter clean
echo.
echo Getting dependencies...
flutter pub get
echo.
echo Building APK with optimized settings...
echo This may take several minutes. Please be patient.
echo.
flutter build apk --release --no-tree-shake-icons --build-number=1 --build-name=1.0.0 --target-platform=android-arm64
echo.
echo Build process completed.
echo.
echo If the build was successful, the APK will be located at:
echo build\app\outputs\flutter-apk\app-release.apk
echo.
echo To install on your Android device:
echo 1. Enable "Install from unknown sources" in your device settings
echo 2. Transfer the APK file to your device
echo 3. Open the APK file on your device and tap "Install"
echo.
pause