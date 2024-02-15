import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/screens/home_screen/home_controller.dart';
import 'package:nexle_testing/utils/common_components.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComp.createAppBar(
        title: 'Home',
        leading: const SizedBox(),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: GestureDetector(
              onTap: () {
                controller.logout();
              },
              child: Container(
                color: Colors.amber,
                height: 50,
                width: 50,
                child: Center(
                  child: CommonComp.setRegularText(txt: 'Logout'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
