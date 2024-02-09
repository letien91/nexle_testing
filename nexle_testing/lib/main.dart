import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nexle_testing/main_binding.dart';
import 'package:nexle_testing/routes/routes.dart';
import 'package:nexle_testing/services/lang/translation_service.dart';
import 'package:nexle_testing/utils/theme_data.dart';

import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependenceInjection().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: Routes.initialRoute,
      getPages: Routes.routes,
      defaultTransition: Transition.fade,
      initialBinding: MainBinding(),
      smartManagement: SmartManagement.keepFactory,
      theme: themeData(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      builder: (BuildContext context, Widget? child) {
        return child!;
      },
    );
  }
}
