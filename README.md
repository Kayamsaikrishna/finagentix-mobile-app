# Fin-Agentix Mobile Application

Fin-Agentix is an AI-powered digital lending platform mobile application built with Flutter.

## Features

- Splash screen with logo
- Multi-language support (12 Indian languages)
- Text-to-speech welcome message in selected language
- User application and Admin application selection
- Tutorial bot toggle functionality
- Complete chatbot integration
- Comprehensive loan sector exploration
- Loan application forms with dynamic sliders
- User dashboard with statistics and recent activities
- Admin dashboard with analytics and management tools
- Settings screens for both user and admin
- APK-ready standalone application

## Supported Languages

1. English (en)
2. Hindi (hi)
3. Tamil (ta)
4. Telugu (te)
5. Malayalam (ml)
6. Kannada (kn)
7. Bengali (bn)
8. Gujarati (gu)
9. Oriya (or)
10. Punjabi (pa)
11. Marathi (mr)
12. Urdu (ur)

## How to Build APK

This repository uses GitHub Actions to automatically build the APK:

1. Every push to the main branch triggers a build
2. Go to the Actions tab to see build progress
3. Download the APK from the Artifacts section

## Installation

1. Download the APK file
2. Enable "Install from unknown sources" in your device settings
3. Open the APK file and tap "Install"
4. Launch the app

## Development

To run locally:
```
flutter pub get
flutter run
```

To build APK locally:
```
flutter build apk --release
```

## Application Flow

1. **Splash Screen**: Initial loading screen with logo
2. **Language Selection**: Choose from 12 Indian languages
3. **App Selection**: Choose between User Application and Admin Application
4. **User Application**: 
   - Dashboard with loan statistics and credit score
   - Loan sectors with detailed information
   - Loan application forms with amount and tenure sliders
   - User profile management
   - Settings configuration
   - Chatbot integration
   - Tutorial bot toggle
5. **Admin Application**:
   - Dashboard with comprehensive analytics and statistics
   - Navigation drawer with all admin sections (Dashboard, Marketplace, Partners, Consumption Loans, Applications, Users, Analytics, Reports, Settings)
   - Settings configuration with advanced options
   - Chatbot integration
   - Tutorial bot toggle

## Dependencies

- flutter_tts: For text-to-speech functionality
- provider: For state management
- http: For API calls (if needed in future)
- shared_preferences: For storing user preferences
- flutter_svg: For SVG image support

## Architecture

The application follows a clean architecture pattern with:

- **Models**: Data models for Language and LoanSector
- **Services**: TranslationService and TTSService for handling translations and text-to-speech
- **Providers**: AppProvider for state management
- **Screens**: Individual screens for each part of the application flow
  - User screens: dashboard, loans, profile, settings, loan application
  - Admin screens: dashboard, settings
- **Widgets**: Reusable UI components

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

## License

This project is proprietary and confidential.

## Contact

For support or queries, please contact the development team.