# NovaHub

A modern, scalable Flutter mobile application for Android and iOS built with Clean Architecture, Riverpod state management, Firebase backend integration, and SQLite for local data persistence.

## 📋 Overview

NovaHub is a feature-rich mobile application designed with professional architecture patterns and best practices. It demonstrates modern Flutter development with:

- **Clean Architecture** - Separation of concerns with Data, Domain, and Presentation layers
- **State Management** - Riverpod for reactive and testable state management
- **Firebase Integration** - Authentication, Firestore database, and Cloud Storage
- **Local Storage** - SQLite for offline-first capabilities
- **Type Safety** - Strong typing with Dart and Riverpod
- **Scalability** - Modular structure for easy feature addition

## 🚀 Features

- User authentication with Firebase
- Real-time data synchronization with Firestore
- Local SQLite database for offline access
- Clean and responsive UI
- Comprehensive error handling
- Logging and debugging capabilities
- Multi-language support (ready for localization)

## 🛠️ Technology Stack

- **Framework**: Flutter 3.10.0+
- **Language**: Dart 3.0.0+
- **State Management**: Riverpod 2.4.0+
- **Backend**: Firebase (Auth, Firestore, Storage)
- **Local DB**: SQLite
- **Architecture**: Clean Architecture

## 📁 Project Structure

```
lib/
├── config/              # App configuration and constants
│   ├── firebase_config.dart
│   └── app_constants.dart
├── core/                # Core utilities and exceptions
│   ├── error/
│   ├── network/
│   ├── local_storage/
│   └── utils/
├── data/                # Data layer (repositories implementation)
│   ├── datasources/
│   │   ├── local/
│   │   └── remote/
│   ├── models/
│   └── repositories/
├── domain/              # Domain layer (business logic)
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/        # Presentation layer (UI)
│   ├── pages/
│   ├── widgets/
│   ├── providers/
│   └── styles/
└── main.dart            # Application entry point
```

## 📱 Getting Started

### Prerequisites

- Flutter SDK 3.10.0 or higher
- Dart 3.0.0 or higher
- Android SDK (for Android development)
- Xcode (for iOS development)
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/luismiguel4953-stack/Creador-.git
   cd Creador-
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a Firebase project in [Firebase Console](https://console.firebase.google.com)
   - Download `google-services.json` for Android and place it in `android/app/`
   - Download `GoogleService-Info.plist` for iOS and add it to Xcode project
   - Run `flutterfire configure` (optional, for automatic setup)

4. **Generate code (Riverpod generators)**
   ```bash
   flutter pub run build_runner build
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 🔨 Development Commands

```bash
# Generate all generated files
flutter pub run build_runner build

# Watch for changes and auto-generate
flutter pub run build_runner watch

# Clean generated files
flutter pub run build_runner clean

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format lib/

# Build for release (Android APK)
flutter build apk --release

# Build for release (Android App Bundle)
flutter build appbundle --release

# Build for iOS
flutter build ios --release
```

## 📖 Architecture Guide

### Layers

**Presentation Layer**
- Contains UI components (pages, widgets)
- Handles user interactions
- Uses Riverpod providers for state management
- Remains decoupled from business logic

**Domain Layer**
- Contains business logic and rules
- Defines entities and repository interfaces
- Contains use cases for specific functionalities
- Independent of frameworks and external dependencies

**Data Layer**
- Implements repository interfaces from domain
- Manages data sources (Firebase, SQLite, APIs)
- Handles data transformation and caching
- Contains models and data source implementations

### Dependency Injection

Using `get_it` for service locator and Riverpod for dependency management.

## 🧪 Testing

Tests are organized by layer:
- `test/unit/` - Domain layer and utility tests
- `test/widget/` - Widget/UI tests
- `test/integration/` - Integration tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 📝 Contributing

1. Create a feature branch (`git checkout -b feature/amazing-feature`)
2. Commit changes with clear messages (`git commit -m 'feat: add amazing feature'`)
3. Push to branch (`git push origin feature/amazing-feature`)
4. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Luis Miguel** - [GitHub](https://github.com/luismiguel4953-stack)

## 🤝 Support

For support, email or open an issue in the repository.

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev)
- [Firebase for Flutter](https://firebase.flutter.dev)
- [Clean Architecture](https://resocoder.com/flutter-clean-architecture)

---

**Last Updated**: August 2026
**Status**: In Development 🚀