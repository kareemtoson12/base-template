# Flutter Starter Template

A production-ready Flutter starter template built with a scalable **Feature-First Architecture** and a robust **Core Module**. It comes pre-configured with essential industry-standard packages to save you hours of initial setup time.

## 🚀 Pre-installed Packages

* **State Management:** `flutter_bloc`, `bloc`, `equatable`
* **Networking & APIs:** `dio`, `retrofit`
* **Dependency Injection:** `get_it`
* **Local Storage:** `shared_preferences`, `flutter_secure_storage`
* **UI Utilities:** `loader_overlay`, `shimmer`, `flutter_native_splash`
* **Localization:** `easy_localization`

## 📁 Architecture Overview

This project uses a clean, modular structure to ensure maintainability and separation of concerns.

```text
lib/
├── core/                       # Shared modules and foundation
│   ├── di/                     # Dependency Injection (GetIt setup)
│   ├── networking/             # Dio config, ApiService, Error Handling
│   │   ├── local_storage/      # SharedPreferences and SecureStorage wrappers
│   │   └── models/             # API request/response models (Barrel File)
│   ├── res/                    # Assets paths and constants
│   ├── routing/                # AppRouter and named routes
│   ├── shared_widgets/         # Reusable generic UI components (BaseScaffold, Buttons)
│   ├── styles/                 # Theme and Color constants
│   └── utils/                  # Utility extensions (e.g., MediaQueryValues)
├── features/                   # Feature-based modules
│   ├── auth/                   # Authentication feature
│   │   ├── login/
│   │   └── sign_up/
│   ├── home/                   # Home feature
│   └── splash/                 # Splash screen
├── app_name.dart               # Main MaterialApp wrapper (Localization & Theme applied)
└── main.dart                   # Entry point (DI and environment initialization)
```

## 🛠 Setup & Code Generation

Because this template uses `retrofit` for type-safe API calls, you need to run the `build_runner` to generate the corresponding `.g.dart` files whenever you modify `api_services.dart` or add new JSON models.

Run the following command in your terminal:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🌐 Localization (i18n)

Translations are located in `assets/translations/`. 
The app is currently configured to support English (`en.json`) and Arabic (`ar.json`).

To translate a string in your UI, use the `.tr()` extension:
```dart
Text('welcome'.tr())
```

## 💾 Local Storage

Never call `SharedPreferences` or `FlutterSecureStorage` directly from your UI or Cubits. Instead, use the provided wrapper classes located in `core/networking/local_storage/` to keep your app decoupled:
* `SharedPrefHelper` - For standard non-sensitive app preferences.
* `SecureStorageHelper` - For sensitive data like JWT tokens and passwords.

## 🧩 Adding a New Feature

When creating a new feature (e.g., `Profile`), follow this standard layered structure inside `lib/features/profile/`:
1. `ui/` - Screens and widgets specific to the profile.
2. `logic/` - Your Bloc or Cubit.
3. `data/` - Repositories talking to your `ApiService` (or just inject the service directly if keeping it simple).
