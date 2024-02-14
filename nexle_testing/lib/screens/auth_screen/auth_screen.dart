import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/constants/colors.dart';
import 'package:nexle_testing/constants/strings.dart';
import 'package:nexle_testing/screens/auth_screen/auth_controller.dart';
import 'package:nexle_testing/screens/auth_screen/components/auth_background.dart';
import 'package:nexle_testing/screens/auth_screen/components/auth_email_text_field.dart';
import 'package:nexle_testing/screens/auth_screen/components/auth_password_text_field.dart';
import 'package:nexle_testing/screens/term_and_privacy/term_and_privacy_screen.dart';
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
        child: GestureDetector(
          onTap: () {
            //TODO: hạ bàn phím
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            body: _buildBody(),
          ),
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
      child: const AuthBackground(),
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
              SizedBox(height: getProportionateScreenHeight(325)),
              CommonComp.setRegularText(
                txt: 'Let\'s get you started!',
                fontSize: 22,
              ),
              SizedBox(height: getProportionateScreenHeight(74)),
              const AuthEmailTextField(),
              SizedBox(height: getProportionateScreenHeight(23)),
              const AuthPasswordTextField(),
              SizedBox(height: getProportionateScreenHeight(49)),
              _buildAllowBox(),
              SizedBox(height: getProportionateScreenHeight(29)),
              _buildTermAndPrivacy(),
              SizedBox(height: getProportionateScreenHeight(30)),
              _buildSignInButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllowBox() {
    return GestureDetector(
      onTap: () {
        controller.onCheckTaS();
      },
      child: Container(
        height: 23,
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColor.deepDenim,
                  ),
                ),
                child: Obx(
                  () => AnimatedOpacity(
                    duration: const Duration(milliseconds: 120),
                    opacity: controller.isCheckedTAS.value ? 1.0 : 0.0,
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: AppColor.deepDenim,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CommonComp.setRegularText(
                txt: 'I am over 16 years of age',
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermAndPrivacy() {
    return RichText(
      softWrap: true,
      overflow: TextOverflow.clip,
      text: TextSpan(
        text: '',
        children: <TextSpan>[
          const TextSpan(
            text: 'By clicking Sign Up,'
                'you are indicating that you have read and agree to the ',
          ),
          TextSpan(
            text: 'Terms of Service',
            style: const TextStyle(
              color: AppColor.deepDenim,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(() => const TermAndService(title: 'Terms of Service'));
              },
          ),
          const TextSpan(
            text: ' and ',
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(
              color: AppColor.deepDenim,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(() => const TermAndService(title: 'Privacy Policy'));
              },
          ),
        ],
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white.withOpacity(0.5),
          fontFamily: kFontName,
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      height: 54,
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Text(
              'Sign Up',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: kFontName,
              ),
              overflow: TextOverflow.clip,
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: GestureDetector(
              onTap: () {
                controller.onSubmitted();
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(54 / 2),
                    border: Border.all(
                      color: AppColor.deepDenim
                          .withOpacity(controller.isGoodForm.value ? 1.0 : 0.5),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white
                        .withOpacity(controller.isGoodForm.value ? 1.0 : 0.5),
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
