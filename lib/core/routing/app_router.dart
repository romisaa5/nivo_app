import 'package:go_router/go_router.dart';
import 'package:nivo/core/routing/routes.dart';

abstract class AppRouter {
  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(initialLocation: Routes.onboarding, routes: [
      
      ],
    );
  }
}
