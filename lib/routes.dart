import 'package:countries_app/ui/screens/home_screen.dart';
import 'package:countries_app/ui/screens/countrydetailsscreen.dart';
import 'package:countries_app/data/models/country.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => HomeScreen(),
      ),
      GoRoute(
        path: '/country-detail',
        builder: (context, state) {
          final country = state.extra as Country;
          return CountryDetailScreen(country: country);
        },
      ),
    ],
  );
}