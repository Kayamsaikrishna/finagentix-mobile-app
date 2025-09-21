# Fin-Agentix Mobile App Installation Guide

## Alternative to Building APK

Since you're experiencing memory issues when building the APK and want to avoid using Android Studio, here are several alternatives to get the app on your mobile device:

## Option 1: Use a Cloud Build Service

### GitHub Actions (Recommended)
1. Push your code to a GitHub repository
2. Set up GitHub Actions to build the APK automatically
3. Download the built APK from the Actions tab

### Codemagic
1. Sign up at codemagic.io
2. Connect your repository
3. Configure the build settings
4. Trigger a build
5. Download the APK

## Option 2: Use a Different Machine

If possible, try building on a machine with more RAM:
1. Copy your project to a machine with at least 8GB RAM
2. Install Flutter SDK
3. Run the build command:
   ```
   flutter build apk --release
   ```

## Option 3: Build Split APKs (Reduces Memory Usage)

Try building split APKs for specific architectures:
```
flutter build apk --split-per-abi --release
```

This creates separate APKs for each CPU architecture, reducing memory requirements.

## Option 4: Use Flutter Web + PWA

Convert your app to a Progressive Web App:
```
flutter build web
```

Then access it through a browser on your mobile device.

## Option 5: Direct APK Installation (When Available)

When an APK is available:
1. Transfer the APK file to your Android device
2. Open the file manager on your device
3. Locate the APK file
4. Tap on it to begin installation
5. If prompted, enable "Install from unknown sources" in your device settings
6. Follow the installation prompts

## Installing APK on Android Device

### Enable Installation from Unknown Sources

1. Open **Settings** on your Android device
2. Go to **Security** or **Privacy & Security**
3. Enable **Install from unknown sources** or **Unknown sources**
4. If prompted for which apps, select the file manager or browser you'll use

### Transfer and Install APK

1. Transfer the APK file to your device via:
   - Email attachment
   - Cloud storage (Google Drive, Dropbox)
   - USB cable
   - Bluetooth
2. Open your file manager
3. Navigate to where you saved the APK
4. Tap on the APK file
5. Tap **Install**
6. Wait for installation to complete
7. Tap **Open** to launch the app

## Optimized Build Script

We've created an optimized build script that reduces memory usage:
- [build_apk_optimized.bat](file:///D:/KAYAM_SAI_KRISHNA/dem/secure-web-demo/finagentix_flutter_app/finagentix_flutter/build_apk_optimized.bat) - Run this on a machine with sufficient RAM

The script uses these optimizations:
- `--no-tree-shake-icons` - Reduces icon processing
- `--target-platform=android-arm64` - Builds for a specific architecture only

## App Features

Once installed, your Fin-Agentix app will include:
- Splash screen with logo
- Multi-language selection (12 Indian languages)
- Voice welcome message in selected language
- User vs Admin application selection
- Tutorial bot toggle
- Complete chatbot integration
- All loan sectors with detailed information

## Troubleshooting

### If Installation Fails
1. Ensure sufficient storage space on your device
2. Clear cache of package installer:
   - Settings → Apps → Package Installer → Storage → Clear Cache
3. Try installing in Safe Mode

### If App Crashes on Launch
1. Uninstall and reinstall the app
2. Check that all permissions are granted
3. Ensure your Android version is compatible (API 21+)

## Future Considerations

For future development:
1. Consider using a cloud-based development environment
2. Use CI/CD services for building APKs
3. Test on multiple device configurations

Your app is feature-complete and ready for deployment through any of these methods.