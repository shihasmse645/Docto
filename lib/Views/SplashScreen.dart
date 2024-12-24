import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghotest/Controller/AuthController.dart';
import 'package:ghotest/constants/AppColors.dart';

class SplashScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(
          'assets/images/logos.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
