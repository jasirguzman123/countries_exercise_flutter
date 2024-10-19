import 'package:countries_app/ui/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => HomeScreen(),
      ),
    ],
  );
}
