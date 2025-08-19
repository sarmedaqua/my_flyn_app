import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';



class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // manually inject controller
    final controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: const Color(0xFF6A1B9A),
      body: Center(
        child: Text(
          'MY FLYN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
