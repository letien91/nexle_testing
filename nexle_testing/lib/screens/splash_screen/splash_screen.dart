
import 'package:flutter/material.dart';
import 'package:nexle_testing/services/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      color: Colors.black,
    );
  }
}