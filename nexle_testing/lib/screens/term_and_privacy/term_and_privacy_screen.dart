import 'package:flutter/material.dart';
import 'package:nexle_testing/components/custom_back_button.dart';
import 'package:nexle_testing/utils/common_components.dart';

class TermAndService extends StatelessWidget {
  const TermAndService({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CommonComp.createAppBar(
        title: title,
        leading: const CustomBackButton(
          iconData: Icons.close,
        ),
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
