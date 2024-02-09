import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nexle_testing/components/custom_back_button.dart';
import 'package:nexle_testing/constants/strings.dart';
import 'package:nexle_testing/utils/theme_data.dart';

class CommonComp {
  CommonComp._();

  static AppBar createAppBar({
    String title = '',
    bool showBackButton = true,
    Widget? leading,
    VoidCallback? onBackPress,
    List<Widget>? actions,
    double elevation = 0.0,
    Color? backgroundColor = Colors.transparent,
    double? leadingWidth,
    bool isCenterTitle = true,
    bool excludeHeaderSemantics = false,
  }) {
    late Widget _leading = Container();
    if (leading != null) {
      _leading = leading;
    } else if (showBackButton) {
      _leading = CustomBackButton(
        onPress: onBackPress,
      );
    }
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: isCenterTitle,
      systemOverlayStyle: themeData().copyWith().appBarTheme.systemOverlayStyle,
      automaticallyImplyLeading: leading != null,
      leading: _leading,
      leadingWidth: leadingWidth,
      actions: actions,
      elevation: elevation,
      excludeHeaderSemantics: excludeHeaderSemantics,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: themeData().copyWith().appBarTheme.titleTextStyle,
      ),
    );
  }

  static Widget loadAsset(
    String name, {
    BoxFit? boxFit,
    Color? tintColor,
    Rect? centerSlice,
    double? width,
    double? height,
  }) {
    return Image.asset(
      'assets/images/$name',
      fit: boxFit,
      color: tintColor,
      centerSlice: centerSlice,
      width: width,
      height: height,
    );
  }

  static Widget loadImage(
    String? data, {
    String placeholder = 'assets/images/signin-bg.jpg',
    Widget? placeholderWidget,
    BoxFit? boxFit,
    Color? tintColor,
    Widget? errorWidget,
  }) {
    if (data != null && data.isNotEmpty) {
      if (data.startsWith('http')) {
        return CachedNetworkImage(
          imageUrl: data,
          placeholder: (BuildContext context, String url) =>
              placeholderWidget ?? Image.asset(placeholder),
          errorWidget: (BuildContext context, String url, dynamic error) {
            return errorWidget ?? Image.asset(placeholder);
          },
          fit: boxFit,
        );
      } else if (data.startsWith('assets/')) {
        return Image.asset(
          data,
          fit: boxFit,
          color: tintColor,
        );
      } else {
        return Image.asset(
          'assets/images/$data',
          fit: boxFit,
          color: tintColor,
          errorBuilder:
              (BuildContext context, Object object, StackTrace? stack) {
            return Image.file(
              File(data),
              fit: boxFit,
              color: tintColor,
            );
          },
        );
      }
    } else {
      return Image.asset(
        placeholder,
        fit: boxFit,
        errorBuilder:
            (BuildContext context, Object object, StackTrace? stackTrace) {
          return errorWidget ?? Image.asset(placeholder);
        },
      );
    }
  }

  static Text setBoldText({
    required String txt,
    double fontSize = 14,
    Color color = const Color.fromRGBO(33, 33, 33, 1),
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return Text(
      txt,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
        fontFamily: kFontName,
        decoration: textDecoration,
      ),
      maxLines: maxLine,
      overflow: overflow,
    );
  }

  static Text setRegularText({
    required String txt,
    double fontSize = 14,
    Color color = Colors.white,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return Text(
      txt,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: kFontName,
        decoration: textDecoration,
      ),
      maxLines: maxLine,
      overflow: overflow,
    );
  }

  static Text setSemiBoldText({
    required String txt,
    double fontSize = 14,
    Color color = const Color.fromRGBO(33, 33, 33, 1),
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextBaseline baseLine = TextBaseline.alphabetic,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return Text(
      txt,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: kFontName,
        fontWeight: FontWeight.w600,
        decoration: textDecoration,
        textBaseline: baseLine,
      ),
      maxLines: maxLine,
      overflow: overflow,
    );
  }
}
