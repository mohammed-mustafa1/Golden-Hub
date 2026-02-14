import 'package:go_router/go_router.dart';
import 'package:golden_hub/features/home/data/models/metal_model.dart';
import 'package:golden_hub/features/home/presentation/views/metal_view.dart';
import 'package:golden_hub/features/home/presentation/views/home_view.dart';
import 'package:golden_hub/features/splash/presentation/views/splash_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String gold = '/gold';

  static final GoRouter routers = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashView()),

      GoRoute(path: home, builder: (context, state) => HomeView()),
      GoRoute(
        path: gold,
        builder: (context, state) =>
            MetalView(metalModel: state.extra as MetalModel),
      ),
    ],
  );
}
