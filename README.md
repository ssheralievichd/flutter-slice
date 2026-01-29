# Flutter FSD Boilerplate

A production-ready Flutter boilerplate implementing Feature-Sliced Design (FSD) architecture with clean, scalable code organization.

## Architecture Overview

This boilerplate follows the **Feature-Sliced Design** methodology, which provides a clear separation of concerns and promotes scalability in Flutter applications.

### FSD Layer Hierarchy

```
┌─────────────────────────────────────────────┐
│                    app/                     │  Application initialization
│  ┌──────────┬──────────┬───────────┐       │
│  │providers │  router  │   theme   │       │
│  └──────────┴──────────┴───────────┘       │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│                  pages/                     │  Page compositions
│  ┌──────┬───────┬──────────┬────────┐      │
│  │ home │profile│ settings │  etc   │      │
│  └──────┴───────┴──────────┴────────┘      │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│                features/                    │  User features
│  ┌────────┬────────┬──────────┬──────┐     │
│  │  auth  │ search │  filters │ etc  │     │
│  └────────┴────────┴──────────┴──────┘     │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│                entities/                    │  Business entities
│  ┌──────┬─────────┬─────────┬────────┐     │
│  │ user │ product │ category│  etc   │     │
│  └──────┴─────────┴─────────┴────────┘     │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│                 shared/                     │  Infrastructure
│  ┌─────┬────────┬──────┬────────┐          │
│  │ api │ config │  ui  │ utils  │          │
│  └─────┴────────┴──────┴────────┘          │
└─────────────────────────────────────────────┘
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
│   └── home/
│       └── home_page.dart
│
├── features/               # Isolated user features (empty - ready for your features)
│
├── entities/               # Business entities (empty - ready for your entities)
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

| Type | File Name | Class Name | Example |
|------|-----------|------------|---------|
| Model | `[entity]_model.dart` | `[Entity]Model` | `user_model.dart` → `UserModel` |
| Repository | `[entity]_repository.dart` | `[Entity]Repository` | `user_repository.dart` → `UserRepository` |
| State | `[entity]_state.dart` | `[Entity]State` | `user_state.dart` → `UserState` |
| Page | `[page]_page.dart` | `[Page]Page` | `home_page.dart` → `HomePage` |
| Widget | `[name]_widget.dart` | `[Name]Widget` | `custom_button.dart` → `CustomButton` |
| Feature UI | `[widget].dart` | `[Widget]` | `login_form.dart` → `LoginForm` |

### Directory Naming
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

**Dependency Rules:**
```
✅ pages → features
✅ pages → entities
✅ pages → shared

✅ features → entities
✅ features → shared

✅ entities → shared

❌ shared → entities
❌ shared → features
❌ shared → pages

❌ entities → features
❌ entities → pages

❌ features → pages
```

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

### 6. Import Organization
Organize imports in this order within each file:

```dart
// 1. Dart imports
import 'dart:async';
import 'dart:convert';

// 2. Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 3. Package imports
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

// 4. Project imports (alphabetically by layer)
import '../../../app/router/route_paths.dart';
import '../../../entities/user/models/user_model.dart';
import '../../../shared/api/client/api_client.dart';
import '../../../shared/ui/widgets/loading_indicator.dart';
```

## State Management Flow

```
User Action (UI)
       ↓
Page listens to State
       ↓
State calls Repository
       ↓
Repository calls ApiClient
       ↓
ApiClient makes HTTP request
       ↓
Response → Model
       ↓
State updates and notifies
       ↓
UI rebuilds
```

### Complete Example Flow

```dart
// 1. User taps button in HomePage (pages/)
onPressed: () {
  final state = context.read<ProductState>();
  state.loadProducts();
}

// 2. ProductState (entities/product/state/)
class ProductState extends ChangeNotifier {
  final ProductRepository _repository;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    _products = await _repository.getAll();

    _isLoading = false;
    notifyListeners();
  }
}

// 3. ProductRepository (entities/product/api/)
class ProductRepository {
  final ApiClient _client;

  Future<List<ProductModel>> getAll() async {
    final response = await _client.get('/products');
    return (response.data as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }
}

// 4. ApiClient (shared/api/client/)
class ApiClient {
  Future<Response<T>> get<T>(String path) async {
    return await _dio.get<T>(path);
  }
}

// 5. UI updates automatically via Consumer
Consumer<ProductState>(
  builder: (context, state, _) {
    if (state.isLoading) return LoadingIndicator();
    return ProductList(products: state.products);
  },
)
```

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

## Code Templates

### Entity Structure Template

```
entities/
└── [entity_name]/
    ├── models/
    │   └── [entity]_model.dart          # Data models with JSON serialization
    ├── api/
    │   └── [entity]_repository.dart     # API calls and data fetching
    └── state/
        └── [entity]_state.dart          # State management with ChangeNotifier
```

**Example: User Entity**

```dart
// entities/user/models/user_model.dart
class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}

// entities/user/api/user_repository.dart
class UserRepository {
  final ApiClient _client;

  UserRepository(this._client);

  Future<UserModel> getById(String id) async {
    final response = await _client.get('/users/$id');
    return UserModel.fromJson(response.data);
  }

  Future<List<UserModel>> getAll() async {
    final response = await _client.get('/users');
    return (response.data as List)
        .map((json) => UserModel.fromJson(json))
        .toList();
  }

  Future<UserModel> create(UserModel user) async {
    final response = await _client.post('/users', data: user.toJson());
    return UserModel.fromJson(response.data);
  }
}

// entities/user/state/user_state.dart
class UserState extends ChangeNotifier {
  final UserRepository _repository;
  List<UserModel> _users = [];
  bool _isLoading = false;

  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;

  UserState(this._repository);

  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners();

    _users = await _repository.getAll();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> createUser(UserModel user) async {
    final created = await _repository.create(user);
    _users.add(created);
    notifyListeners();
  }
}
```

### Feature Structure Template

```
features/
└── [feature_name]/
    ├── ui/
    │   └── [widget]_widget.dart         # Feature UI components
    ├── models/
    │   └── [model]_model.dart           # Feature-specific models
    └── api/
        └── [feature]_api.dart           # Feature-specific API calls
```

**Example: Authentication Feature**

```dart
// features/authentication/ui/login_form.dart
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(controller: _emailController),
          TextFormField(controller: _passwordController, obscureText: true),
          ElevatedButton(onPressed: _handleLogin, child: Text('Login')),
        ],
      ),
    );
  }

  void _handleLogin() {
    // Handle login logic
  }
}

// features/authentication/models/auth_credentials.dart
class AuthCredentials {
  final String email;
  final String password;

  AuthCredentials({required this.email, required this.password});
}

// features/authentication/api/auth_api.dart
class AuthApi {
  final ApiClient _client;

  AuthApi(this._client);

  Future<String> login(AuthCredentials credentials) async {
    final response = await _client.post('/auth/login', data: {
      'email': credentials.email,
      'password': credentials.password,
    });
    return response.data['token'] as String;
  }

  Future<void> logout() async {
    await _client.post('/auth/logout');
  }
}
```

### Page Structure Template

```
pages/
└── [page_name]/
    ├── [page_name]_page.dart           # Main page widget
    └── widgets/                         # Page-specific widgets (optional)
        ├── [widget]_1.dart
        └── [widget]_2.dart
```

**Example: Product Detail Page**

```dart
// pages/product_detail/product_detail_page.dart
class ProductDetailPage extends StatelessWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Column(
        children: [
          ProductInfoSection(productId: productId),
          ProductReviewsSection(productId: productId),
          ProductActionsBar(productId: productId),
        ],
      ),
    );
  }
}

// pages/product_detail/widgets/product_info_section.dart
class ProductInfoSection extends StatelessWidget {
  final String productId;

  const ProductInfoSection({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    // Widget implementation
    return Container();
  }
}
```

## Adding New Features

### Creating a New Entity

1. Create entity directory:
```bash
mkdir -p lib/entities/product/{models,api,state}
touch lib/entities/product/models/product_model.dart
touch lib/entities/product/api/product_repository.dart
touch lib/entities/product/state/product_state.dart
```

2. Implement the model with JSON serialization
3. Implement the repository with API calls
4. Implement the state provider with ChangeNotifier
5. Register provider in `app/providers/app_providers.dart`

### Creating a New Page

1. Create page directory:
```bash
mkdir -p lib/pages/profile
touch lib/pages/profile/profile_page.dart
```

2. Implement the page widget
3. Add route in `app/router/route_paths.dart`
4. Add route in `app/router/app_router.dart`

### Creating a New Feature

1. Create feature directory:
```bash
mkdir -p lib/features/search/{ui,models,api}
touch lib/features/search/ui/search_bar.dart
touch lib/features/search/models/search_query.dart
```

2. Implement feature components in respective directories
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

## Quick Reference Commands

### Scaffold New Modules

```bash
# Create new entity
mkdir -p lib/entities/[name]/{models,api,state}
touch lib/entities/[name]/models/[name]_model.dart
touch lib/entities/[name]/api/[name]_repository.dart
touch lib/entities/[name]/state/[name]_state.dart

# Create new feature
mkdir -p lib/features/[name]/{ui,models,api}
touch lib/features/[name]/ui/[widget].dart
touch lib/features/[name]/models/[model].dart

# Create new page
mkdir -p lib/pages/[name]
touch lib/pages/[name]/[name]_page.dart
```

## Resources

- [Feature-Sliced Design](https://feature-sliced.design/)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Provider Package](https://pub.dev/packages/provider)
- [Go Router](https://pub.dev/packages/go_router)
- [Dio HTTP Client](https://pub.dev/packages/dio)

## License

MIT License
