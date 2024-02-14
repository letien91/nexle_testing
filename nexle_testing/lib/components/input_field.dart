import 'package:flutter/material.dart';
import 'package:nexle_testing/constants/strings.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.labelText = '',
    this.labelStyle = const TextStyle(
      fontFamily: kFontName,
      fontSize: 12,
      color: Colors.grey,
      fontWeight: FontWeight.normal,
    ),
    this.style = const TextStyle(
      fontFamily: kFontName,
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    this.isPassword = false,
    this.onFocusChange,
    this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final String labelText;
  final TextStyle labelStyle;
  final TextStyle style;
  final bool isPassword;

  final void Function(bool)? onFocusChange;
  final void Function(String)? onChanged;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final ValueNotifier<bool> _notifierPassword = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: widget.isPassword
          ? _buildListenablePassword()
          : _buildTextField(true),
    );
  }

  Widget _buildTextField(bool isShow) {
    return Focus(
      onFocusChange: (bool isFocus) {
        widget.onFocusChange?.call(isFocus);
      },
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelStyle: widget.labelStyle,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: _buildPasswordEye(),
        ),
        style: widget.style,
        cursorColor: Colors.white,
        keyboardType: widget.keyboardType,
        obscureText: !isShow,
        obscuringCharacter: '*',
        autocorrect: false,
        onChanged: widget.onChanged,
      ),
    );
  }

  Widget _buildListenablePassword() {
    return ValueListenableBuilder<bool>(
      valueListenable: _notifierPassword,
      builder: (BuildContext context, bool isShow, Widget? child) {
        return _buildTextField(isShow);
      },
    );
  }

  Widget _buildPasswordEye() {
    if (!widget.isPassword) {
      return const SizedBox();
    }

    return ValueListenableBuilder<bool>(
      valueListenable: _notifierPassword,
      builder: (BuildContext context, bool isShow, Widget? child) {
        return GestureDetector(
          onTap: () {
            _notifierPassword.value = !_notifierPassword.value;
          },
          child: Container(
            color: Colors.transparent,
            height: 44,
            width: 44,
            alignment: Alignment.centerRight,
            child: Icon(
              isShow ? Icons.visibility : Icons.visibility_off,
              color: Colors.white.withOpacity(0.5),
              size: 15,
            ),
          ),
        );
      },
    );
  }
}
