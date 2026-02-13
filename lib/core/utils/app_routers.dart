import 'package:go_router/go_router.dart';
import 'package:gold_hub/features/home/presentation/views/home_view.dart';
import 'package:gold_hub/features/splash/presentation/views/splash_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';

  static final GoRouter routers = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashView()),

      GoRoute(path: home, builder: (context, state) => HomeView()),
    ],
  );
}
