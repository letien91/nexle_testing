import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/screens/categories_screen/categories_controller.dart';
import 'package:nexle_testing/screens/categories_screen/components/categories_background.dart';

class CategoriesAppBar extends GetView<CategoriesController> {
  const CategoriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: controller.headerHeight,
            child: const CategoriesBackground(),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
            child: Container(),
          ),
        ),
      ],
    );
  }
}
