
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/password_controller.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class PasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PasswordController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),

      // ✅ Body scrollable (prevents overflow when keyboard opens)
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Title
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 24.h),
              child: Text(
                '비밀번호 설정',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),

            // Old password field
            CustomTextField(
              label: '기본 비밀번호 *',
              hint: '8-16자리 영문, 숫자, 특수문자 조합',
              controller: controller.oldPasswordController,
              obscureText: true,
            ),
            SizedBox(height: 16.h),

            // New password field
            CustomTextField(
              label: '새 비밀번호 *',
              hint: '8-16자리 영문, 숫자, 특수문자 조합',
              controller: controller.newPasswordController,
              obscureText: true,
            ),
            SizedBox(height: 16.h),

            // Confirm password field
            CustomTextField(
              label: '비밀번호 확인 *',
              hint: '비밀번호를 재입력해 주세요.',
              controller: controller.confirmPasswordController,
              obscureText: true,
            ),

            SizedBox(height: 80.h), // extra space so fields don’t clash with button
          ],
        ),
      ),

      // ✅ Button fixed at bottom
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(20.w),
        child: SizedBox(
          width: double.infinity,
          height: 52.h,
          child: CustomButton(
            text: '완료',
            onPressed: controller.updatePassword,
          ),
        ),
      ),
    );
  }
}
