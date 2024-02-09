import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    this.onPress,
    this.color = const Color.fromRGBO(255, 255, 255, 1),
    this.iconData,
  }) : super(key: key);

  final Function? onPress;
  final Color color;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        } else {
          Navigator.pop(context);
        }
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Positioned(
                top: 1,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
                  child: IconTheme(
                    data: const IconThemeData(
                      opacity: 0.5,
                    ),
                    child: Icon(
                      iconData ?? Icons.keyboard_backspace_rounded,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.5,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
                  child: IconTheme(
                    data: const IconThemeData(
                      opacity: 0.5,
                    ),
                    child: Icon(
                      iconData ?? Icons.keyboard_backspace_rounded,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Icon(
                iconData ?? Icons.keyboard_backspace_rounded,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
