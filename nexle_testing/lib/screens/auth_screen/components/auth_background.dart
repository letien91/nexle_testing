import 'package:flutter/material.dart';
import 'package:nexle_testing/constants/colors.dart';
import 'package:nexle_testing/services/size_config.dart';
import 'package:nexle_testing/utils/common_components.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(703),
      height: getProportionateScreenWidth(469),
      child: Stack(
        children: <Widget>[
          Positioned.fill(child: CommonComp.loadAsset('signin-bg.jpg')),
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
