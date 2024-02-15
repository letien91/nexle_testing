import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nexle_testing/constants/colors.dart';
import 'package:nexle_testing/services/size_config.dart';
import 'package:nexle_testing/utils/common_components.dart';

class CategoriesBackground extends StatelessWidget {
  const CategoriesBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(275),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -265,
            left: -42,
            child: SizedBox(
              width: getProportionateScreenWidth(500),
              height: getProportionateScreenWidth(750),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: CommonComp.loadAsset('categories-bg.png'),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    AppColor.fromHex('1D2238').withOpacity(0.13),
                    AppColor.fromHex('000000'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
