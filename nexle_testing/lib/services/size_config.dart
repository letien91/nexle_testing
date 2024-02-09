import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;
  static late double statusBarHeight;
  static late double bottomPadding;
  static late double devicePixelRatio;
  static late double screenSafeHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    statusBarHeight = _mediaQueryData.padding.top;
    bottomPadding = _mediaQueryData.padding.bottom;
    devicePixelRatio = _mediaQueryData.devicePixelRatio;
    screenSafeHeight = screenHeight - statusBarHeight;

    // On iPhone 11 the defaultSize = 10 almost
    // So if the screen size increase or decrease then our defaultSize also vary
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }

  static double getDeviceSize(double originalSize) {
    if (devicePixelRatio <= 1) {
      return originalSize;
    } else if (devicePixelRatio <= 2) {
      return originalSize * 2;
    } else {
      return originalSize * 3;
    }
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}
