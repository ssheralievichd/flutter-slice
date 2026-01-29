import 'package:go_router/go_router.dart';
import 'route_paths.dart';
import '../../pages/home/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutePaths.home,
    routes: [
      GoRoute(
        path: RoutePaths.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
