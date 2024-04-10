import 'package:clock_app/heders.dart';

class AppRoutes {
  static String splashScreens = '/';
  static String homePage = 'home_page';

  static Map<String, WidgetBuilder> routes = {
    splashScreens: (context) => const SplashScreens(),
    homePage: (context) => const HomePage()
  };
}
