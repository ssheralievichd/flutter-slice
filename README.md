# Flutter FSD Boilerplate

A production-ready Flutter boilerplate implementing Feature-Sliced Design (FSD) architecture with clean, scalable code organization.

## Architecture Overview

This boilerplate follows the **Feature-Sliced Design** methodology, which provides a clear separation of concerns and promotes scalability in Flutter applications.

### FSD Layers

```
lib/
├── app/                    # Application layer
├── pages/                  # Page/Screen compositions
├── features/               # User interaction features
├── entities/               # Business entities
└── shared/                 # Shared infrastructure
```

## Directory Structure

```
lib/
├── app/
│   ├── providers/          # Global state providers
│   │   └── app_providers.dart
│   ├── router/             # Navigation configuration
│   │   ├── app_router.dart
│   │   └── route_paths.dart
│   ├── theme/              # Theme configuration
│   │   ├── app_theme.dart
│   │   └── theme_provider.dart
│   └── app.dart            # Root application widget
│
├── pages/                  # Complete page implementations
│   ├── home/
│   │   └── home_page.dart
│   └── example_detail/
│
├── features/               # Isolated user features
│   └── example_feature/
│       ├── ui/             # Feature UI components
│       ├── models/         # Feature-specific models
│       └── api/            # Feature-specific API calls
│
├── entities/               # Business entities
│   └── example_entity/
│       ├── models/         # Data models
│       │   └── example_model.dart
│       ├── api/            # Entity API repository
│       │   └── example_repository.dart
│       └── state/          # Entity state management
│           └── example_state.dart
│
└── shared/                 # Shared resources
    ├── api/
    │   ├── client/         # API client configuration
    │   │   └── api_client.dart
    │   └── interceptors/   # HTTP interceptors
    ├── config/             # App configuration
    │   └── app_config.dart
    ├── theme/              # Design tokens
    ├── ui/
    │   ├── components/     # Complex reusable components
    │   ├── widgets/        # Simple UI widgets
    │   │   ├── loading_indicator.dart
    │   │   └── error_display.dart
    │   └── layouts/        # Layout components
    └── utils/
        ├── extensions/     # Dart extensions
        ├── helpers/        # Helper functions
        └── validators/     # Input validators
```

## Layer Responsibilities

### 1. App Layer (`app/`)
Application initialization and global configuration.

**What goes here:**
- Application root widget
- Global providers setup
- Router configuration
- Theme configuration
- App-wide state management

**Key files:**
- `app.dart` - Root MaterialApp widget
- `app_providers.dart` - Global provider initialization
- `app_router.dart` - Navigation routes
- `app_theme.dart` - Theme definitions

### 2. Pages Layer (`pages/`)
Complete page/screen compositions that combine features and entities.

**What goes here:**
- Full-screen pages
- Screen-level state management
- Layout composition
- Navigation between pages

**Naming convention:** `[page_name]_page.dart`

**Example:**
```dart
pages/
├── home/
│   ├── home_page.dart
│   └── widgets/            # Page-specific widgets
├── profile/
│   └── profile_page.dart
└── settings/
    └── settings_page.dart
```

### 3. Features Layer (`features/`)
Isolated, reusable user interaction features.

**What goes here:**
- User interaction logic
- Feature-specific UI components
- Feature-specific business logic
- Local feature state

**Structure:**
```dart
features/
└── [feature_name]/
    ├── ui/                 # Feature UI components
    ├── models/             # Feature models
    └── api/                # Feature API calls
```

**Examples:**
- `authentication/` - Login, registration forms
- `search_filters/` - Filter widgets and logic
- `item_actions/` - CRUD action buttons

### 4. Entities Layer (`entities/`)
Business entities with their data, state, and operations.

**What goes here:**
- Domain models
- Repository pattern implementations
- Entity state management
- Data transformations

**Structure:**
```dart
entities/
└── [entity_name]/
    ├── models/             # Data models
    │   └── [entity]_model.dart
    ├── api/                # API repository
    │   └── [entity]_repository.dart
    └── state/              # State provider
        └── [entity]_state.dart
```

**Key principles:**
- One entity = one business concept
- Repository handles all API interactions
- State provider manages entity lifecycle
- Models handle serialization/deserialization

**Example:**
```dart
entities/
├── user/
│   ├── models/
│   │   └── user_model.dart
│   ├── api/
│   │   └── user_repository.dart
│   └── state/
│       └── user_state.dart
└── product/
    ├── models/
    │   └── product_model.dart
    ├── api/
    │   └── product_repository.dart
    └── state/
        └── product_state.dart
```

### 5. Shared Layer (`shared/`)
Reusable infrastructure and UI components.

**What goes here:**
- API client setup
- Reusable UI components
- Utilities and helpers
- Design system tokens
- Constants and configuration

**Subdivisions:**
- `api/` - HTTP client, interceptors
- `config/` - App configuration
- `theme/` - Colors, typography, spacing
- `ui/components/` - Complex reusable components
- `ui/widgets/` - Simple UI widgets
- `ui/layouts/` - Layout components
- `utils/` - Extensions, helpers, validators

## Naming Conventions

### Files
- **Models:** `[entity]_model.dart`
- **Repositories:** `[entity]_repository.dart`
- **State/Providers:** `[entity]_state.dart`
- **Pages:** `[page_name]_page.dart`
- **Widgets:** `[widget_name]_widget.dart` or `[widget_name].dart`

### Classes
- **Models:** `[Entity]Model`
- **Repositories:** `[Entity]Repository`
- **State:** `[Entity]State`
- **Pages:** `[PageName]Page`
- **Widgets:** `[WidgetName]Widget` or `[WidgetName]`

### Directories
- Use snake_case: `user_profile`, `auth_feature`
- Be descriptive: `product_list` not `list`
- Group by domain: `entities/user/`, `features/authentication/`

## Best Practices

### 1. Dependency Direction
```
pages → features → entities → shared
```
- Upper layers depend on lower layers
- Lower layers are independent
- Shared has no dependencies on other layers

### 2. State Management
- Use `Provider` for state management
- Entity state in `entities/[entity]/state/`
- App-wide state in `app/providers/`
- Local state in `StatefulWidget` when appropriate

### 3. API Integration
- All API calls through repositories
- Repository pattern in `entities/[entity]/api/`
- Shared HTTP client in `shared/api/client/`
- Interceptors in `shared/api/interceptors/`

### 4. Code Organization
- One class per file
- Group related files in directories
- Use index files for public exports
- Keep files focused and small

### 5. Error Handling
- Handle errors in repositories
- Propagate errors through state
- Display errors in UI layer
- Use shared error widgets

## Quick Start

### 1. Installation
```bash
cd flutter_fsd_boilerplate
flutter pub get
```

### 2. Run the app
```bash
flutter run
```

### 3. Generate platform-specific builds
```bash
flutter build apk              # Android APK
flutter build appbundle        # Android App Bundle
flutter build ios              # iOS
```

## Adding New Features

### Creating a New Entity

1. Create entity directory:
```bash
mkdir -p lib/entities/product/{models,api,state}
```

2. Create model:
```dart
lib/entities/product/models/product_model.dart
```

3. Create repository:
```dart
lib/entities/product/api/product_repository.dart
```

4. Create state provider:
```dart
lib/entities/product/state/product_state.dart
```

5. Register provider in `app/providers/app_providers.dart`

### Creating a New Page

1. Create page directory:
```bash
mkdir -p lib/pages/product_detail
```

2. Create page file:
```dart
lib/pages/product_detail/product_detail_page.dart
```

3. Add route in `app/router/route_paths.dart`

4. Add route in `app/router/app_router.dart`

### Creating a New Feature

1. Create feature directory:
```bash
mkdir -p lib/features/product_actions/{ui,models,api}
```

2. Create feature components in respective directories

3. Export public API if needed

## Configuration

### API Configuration
Update `lib/shared/config/app_config.dart`:

```dart
class AppConfig {
  static const String apiBaseUrl = 'https://your-api.com';
  static const int apiTimeout = 30000;
}
```

### Theme Configuration
Modify `lib/app/theme/app_theme.dart` to customize colors, typography, and other design tokens.

## Testing

### Run tests
```bash
flutter test
```

### Run tests with coverage
```bash
flutter test --coverage
```

## Project Dependencies

- **provider** - State management
- **go_router** - Declarative routing
- **dio** - HTTP client
- **shared_preferences** - Local storage
- **intl** - Internationalization

## Folder Creation Commands

Quick commands to scaffold new modules:

```bash
mkdir -p lib/entities/[name]/{models,api,state}

mkdir -p lib/features/[name]/{ui,models,api}

mkdir -p lib/pages/[name]
```

## Resources

- [Feature-Sliced Design](https://feature-sliced.design/)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Provider Package](https://pub.dev/packages/provider)
- [Go Router](https://pub.dev/packages/go_router)
- [Dio HTTP Client](https://pub.dev/packages/dio)

## License

MIT License
