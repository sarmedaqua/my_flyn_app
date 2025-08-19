
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/basic_info_controller.dart';

class BasicInfoView extends StatelessWidget {
  const BasicInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BasicInfoController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(
            () => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Page Title (below AppBar)
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Text(
                  "기본정보",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              _label("아이디"),
              _readOnlyField(controller.idController.text),
              SizedBox(height: 16.h),

              _label("이메일"),
              _inputField(controller.emailController),
              SizedBox(height: 16.h),

              _label("휴대폰 번호"),
              Row(
                children: [
                  Expanded(
                    child: _inputField(controller.phoneController),
                  ),
                  SizedBox(width: 8.w),
                  SizedBox(
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6A1B9A),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      onPressed: controller.verifyPhone,
                      child: Text(
                        "변경하기",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              _label("닉네임"),
              _inputField(controller.nicknameController),
              SizedBox(height: 16.h),

              _label("인스타그램 아이디"),
              _inputField(controller.instagramController),
              SizedBox(height: 16.h),

              _label("대표 작업 링크"),
              _inputField(controller.linkController),
              SizedBox(height: 16.h),

              _label("포트폴리오"),
              GestureDetector(
                onTap: controller.pickPortfolio,
                child: _inputField(
                  TextEditingController(text: controller.portfolioPath.value),
                  enabled: false,
                  suffix: const Icon(Icons.attach_file, size: 20, color: Colors.grey),
                ),
              ),
              SizedBox(height: 40.h),

              /// Save button
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isFormValid.value
                        ? const Color(0xFF6A1B9A)
                        : Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: controller.isFormValid.value
                      ? controller.saveBasicInfo
                      : null,
                  child: Text(
                    "저장하기",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: controller.isFormValid.value
                          ? Colors.white
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  /// ====== Widgets ======

  Widget _label(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _inputField(TextEditingController controller,
      {bool enabled = true, Widget? suffix}) {
    return TextField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        suffixIcon: suffix,
      ),
      style: TextStyle(fontSize: 14.sp),
    );
  }

  Widget _readOnlyField(String text) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
      controller: TextEditingController(text: text),
      style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
    );
  }
}
