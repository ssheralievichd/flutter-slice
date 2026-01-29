# FSD Structure Quick Reference

## Layer Hierarchy

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

## Entity Structure Template

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

### Example: User Entity

```dart
entities/user/
├── models/
│   └── user_model.dart
│       class UserModel {
│         final String id;
│         final String name;
│         final String email;
│
│         UserModel.fromJson(Map<String, dynamic> json) { ... }
│         Map<String, dynamic> toJson() { ... }
│       }
│
├── api/
│   └── user_repository.dart
│       class UserRepository {
│         final ApiClient _client;
│
│         Future<UserModel> getById(String id) { ... }
│         Future<List<UserModel>> getAll() { ... }
│         Future<UserModel> create(UserModel user) { ... }
│       }
│
└── state/
    └── user_state.dart
        class UserState extends ChangeNotifier {
          final UserRepository _repository;
          List<UserModel> _users = [];

          Future<void> loadUsers() { ... }
          Future<void> createUser(UserModel user) { ... }
        }
```

## Feature Structure Template

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

### Example: Authentication Feature

```dart
features/authentication/
├── ui/
│   ├── login_form.dart
│   │   class LoginForm extends StatefulWidget { ... }
│   │
│   └── register_form.dart
│       class RegisterForm extends StatefulWidget { ... }
│
├── models/
│   └── auth_credentials.dart
│       class AuthCredentials {
│         final String email;
│         final String password;
│       }
│
└── api/
    └── auth_api.dart
        class AuthApi {
          Future<String> login(AuthCredentials creds) { ... }
          Future<void> logout() { ... }
        }
```

## Page Structure Template

```
pages/
└── [page_name]/
    ├── [page_name]_page.dart           # Main page widget
    └── widgets/                         # Page-specific widgets (optional)
        ├── [widget]_1.dart
        └── [widget]_2.dart
```

### Example: Product Detail Page

```dart
pages/product_detail/
├── product_detail_page.dart
│   class ProductDetailPage extends StatelessWidget {
│     final String productId;
│
│     @override
│     Widget build(BuildContext context) {
│       return Scaffold(...);
│     }
│   }
│
└── widgets/
    ├── product_info_section.dart
    ├── product_reviews_section.dart
    └── product_actions_bar.dart
```

## Shared Layer Organization

```
shared/
├── api/
│   ├── client/
│   │   └── api_client.dart              # Dio configuration
│   └── interceptors/
│       ├── auth_interceptor.dart
│       └── logging_interceptor.dart
│
├── config/
│   └── app_config.dart                  # App-wide constants
│
├── theme/
│   ├── app_colors.dart                  # Color palette
│   ├── app_typography.dart              # Text styles
│   └── app_spacing.dart                 # Spacing constants
│
├── ui/
│   ├── components/                      # Complex reusable components
│   │   ├── custom_button.dart
│   │   └── custom_card.dart
│   │
│   ├── widgets/                         # Simple UI widgets
│   │   ├── loading_indicator.dart
│   │   └── error_display.dart
│   │
│   └── layouts/                         # Layout components
│       ├── app_scaffold.dart
│       └── responsive_layout.dart
│
└── utils/
    ├── extensions/
    │   ├── string_extensions.dart
    │   └── date_extensions.dart
    │
    ├── helpers/
    │   ├── formatter_helper.dart
    │   └── validation_helper.dart
    │
    └── validators/
        ├── email_validator.dart
        └── phone_validator.dart
```

## Dependency Rules

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

## Naming Conventions

| Type | File Name | Class Name | Example |
|------|-----------|------------|---------|
| Model | `[entity]_model.dart` | `[Entity]Model` | `user_model.dart` → `UserModel` |
| Repository | `[entity]_repository.dart` | `[Entity]Repository` | `user_repository.dart` → `UserRepository` |
| State | `[entity]_state.dart` | `[Entity]State` | `user_state.dart` → `UserState` |
| Page | `[page]_page.dart` | `[Page]Page` | `home_page.dart` → `HomePage` |
| Widget | `[name]_widget.dart` | `[Name]Widget` | `custom_button.dart` → `CustomButton` |
| Feature UI | `[widget].dart` | `[Widget]` | `login_form.dart` → `LoginForm` |

## Quick Commands

### Create New Entity
```bash
mkdir -p lib/entities/product/{models,api,state}
touch lib/entities/product/models/product_model.dart
touch lib/entities/product/api/product_repository.dart
touch lib/entities/product/state/product_state.dart
```

### Create New Feature
```bash
mkdir -p lib/features/search/{ui,models,api}
touch lib/features/search/ui/search_bar.dart
touch lib/features/search/models/search_query.dart
```

### Create New Page
```bash
mkdir -p lib/pages/profile
touch lib/pages/profile/profile_page.dart
```

## Import Organization

Within each file, organize imports in this order:

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

## Example: Complete Flow

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
