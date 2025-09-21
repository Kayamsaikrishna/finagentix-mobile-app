# Lightweight Build Guide for Fin-Agentix App

## Reducing App Size and Memory Usage

To help with the memory issues you're experiencing, here are several approaches to create a lighter version of your app:

## Option 1: Build for Specific Architecture Only

Instead of building for all architectures, build for just one:
```
flutter build apk --release --target-platform=android-arm64
```

Or for older devices:
```
flutter build apk --release --target-platform=android-arm
```

## Option 2: Disable Tree Shaking for Icons

Reduce processing during build:
```
flutter build apk --release --no-tree-shake-icons
```

## Option 3: Reduce Image Assets

The app currently includes many translation files which increase the app size. Consider:
1. Removing unused translation files
2. Compressing images
3. Using vector graphics where possible

## Option 4: Optimize Gradle Settings

Edit `android/gradle.properties` and add:
```
# Reduce memory usage
org.gradle.jvmargs=-Xmx2048m -XX:MaxMetaspaceSize=512m
# Enable daemon
org.gradle.daemon=true
# Enable parallel builds
org.gradle.parallel=true
# Enable configure on demand
org.gradle.configureondemand=true
```

## Option 5: Simplified Dependencies

Consider if all dependencies are necessary:
- flutter_tts (Text-to-speech)
- provider (State management)
- http (HTTP client)
- shared_preferences (Local storage)
- flutter_svg (SVG support)

If you don't need SVG support, you can remove `flutter_svg`.

## Option 6: Profile Build

Use the profile build for testing:
```
flutter build apk --profile
```

This creates a smaller APK but with debugging capabilities.

## Memory Optimization Tips

1. Close other applications while building
2. Restart your computer before building
3. Increase virtual memory (paging file) size
4. Use command prompt as administrator

## Alternative: Use Flutter Web

Convert your app to a web app which can be accessed on mobile:
```
flutter build web
```

Then deploy to a web server and access via mobile browser.

## Lightweight APK Build Script

Use our optimized batch file:
- [build_apk_optimized.bat](file:///D:/KAYAM_SAI_KRISHNA/dem/secure-web-demo/finagentix_flutter_app/finagentix_flutter/build_apk_optimized.bat)

This script automatically applies several optimizations.

## Testing on Device

Once you have an APK:
1. Transfer to your Android device
2. Enable "Install from unknown sources"
3. Open and install the APK
4. Test all features

## Features That May Increase Memory Usage

1. **Text-to-Speech**: Uses system resources
2. **Multiple Languages**: Increases app size
3. **Chatbot**: Complex UI with scrolling
4. **Multiple Screens**: Each screen consumes memory

Consider creating a minimal version with just core features for initial testing.

## Recommended Build Command

Try this command which combines several optimizations:
```
flutter build apk --release --no-tree-shake-icons --target-platform=android-arm64 --split-debug-info=build/debug_info
```

This creates a smaller APK by:
- Disabling icon tree shaking
- Building for one architecture only
- Splitting debug information

## If All Else Fails

Consider using a cloud-based build service:
1. GitHub Actions
2. Codemagic
3. Bitrise
4. App Center

These services have more RAM and can build your APK without local resource constraints.