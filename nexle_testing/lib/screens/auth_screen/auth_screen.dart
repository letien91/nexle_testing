import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/constants/colors.dart';
import 'package:nexle_testing/screens/auth_screen/auth_controller.dart';
import 'package:nexle_testing/services/size_config.dart';
import 'package:nexle_testing/utils/common_components.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        _buildImageCover(),
        _buildContent(),
      ],
    );
  }

  Positioned _buildImageCover() {
    return Positioned(
      left: getProportionateScreenWidth(-93),
      top: 0,
      child: SizedBox(
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
      ),
    );
  }

  Positioned _buildContent() {
    return Positioned.fill(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(24),
            right: getProportionateScreenWidth(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenHeight(325),
              ),
              CommonComp.setRegularText(
                txt: 'Let’s get you started!',
                fontSize: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
