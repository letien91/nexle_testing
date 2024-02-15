import 'package:get/get.dart';
import 'package:nexle_testing/routes/routes_name.dart';
import 'package:nexle_testing/screens/auth_screen/auth_binding.dart';
import 'package:nexle_testing/screens/auth_screen/auth_screen.dart';
import 'package:nexle_testing/screens/categories_screen/categories_binding.dart';
import 'package:nexle_testing/screens/categories_screen/categories_screen.dart';
import 'package:nexle_testing/screens/home_screen/home_binding.dart';
import 'package:nexle_testing/screens/home_screen/home_screen.dart';
import 'package:nexle_testing/screens/splash_screen/splash_binding.dart';
import 'package:nexle_testing/screens/splash_screen/splash_screen.dart';

class Routes {
  static const String initialRoute = RoutesName.splash;
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: RoutesName.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage<dynamic>(
      name: RoutesName.auth,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage<dynamic>(
      name: RoutesName.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      children: const <GetPage<dynamic>>[],
    ),
    GetPage<dynamic>(
      name: RoutesName.categories,
      page: () => const CategoriesScreen(),
      binding: CategoriesBinding(),
    ),
  ];
}
