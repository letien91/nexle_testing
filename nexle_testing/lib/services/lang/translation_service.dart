import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const Locale fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en_US': en_US,
      };
}
