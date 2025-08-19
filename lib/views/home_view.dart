import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/menu_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
              () => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Greeting + Profile
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Greeting Text
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "안녕하세요,\n",
                              style: TextStyle(
                                fontSize: 18.sp, // smaller font
                                fontWeight: FontWeight.normal, // not bold
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "${controller.userName.value}님",
                              style: TextStyle(
                                fontSize: 20.sp, // original size
                                fontWeight: FontWeight.w600, // bold
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Profile Avatar
                    GestureDetector(
                      onTap: controller.uploadProfileImage,
                      child: Container(

                        width: 80.r,
                        height: 80.r,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                          image: controller.profileImage.value != null
                              ? DecorationImage(
                            image: FileImage(
                                File(controller.profileImage.value!.path)),
                            fit: BoxFit.cover,
                          )
                              : null,
                        ),
                        child: controller.profileImage.value == null
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt_outlined,
                                size: 24.sp, color: Colors.grey),
                            SizedBox(height: 4.h),
                            Text(
                              "이미지 등록",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                            : null,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 28.h),

                /// Campaign Stats
                GestureDetector(
                  onTap: () => Get.toNamed('/campaign'),
                  child: Container(
                    width: double.infinity,
                    //padding: EdgeInsets.symmetric(vertical: 2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "나의 캠페인",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _statItem("신청", controller.applications.value),
                            Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey,),
                            _statItem("진행중", controller.inProgress.value),
                            Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey,),
                            _statItem("완료", controller.completed.value),
                          ],
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 28.h),

                /// Menu List
                menuItem(Icons.person_outline, "내 정보",
                    onTap: () => Get.toNamed('/my_info')),
                menuItem(Icons.sticky_note_2_outlined, "공지사항",
                    onTap: () => Get.toNamed('/notices')),
                menuItem(Icons.mark_unread_chat_alt_outlined, "1:1문의",
                    onTap: () => Get.toNamed('/inquiry')),
                menuItem(Icons.live_help_outlined, "FAQ",
                    onTap: () => Get.toNamed('/faq')),
                menuItem(Icons.task_outlined, "약관 및 정책",
                    onTap: () => Get.toNamed('/terms')),
                menuItem(Icons.logout, "로그아웃",
                    onTap: controller.logout),
                menuItem(Icons.cancel_presentation_rounded, "회원탈퇴",
                    onTap: () => Get.toNamed('/withdrawal')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// --- Widgets ---

  Widget _statItem(String title, int count) {
    return Expanded(
      child: Column(
        children: [
          Text(
            "$count",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF6A1B9A),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, color: Colors.black87, fontWeight: FontWeight.w500,),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 24.h,
      color: Colors.grey.shade300,
    );
  }

}
