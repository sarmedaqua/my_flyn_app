import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/my_info_controller.dart';
import '../views/home_view.dart';
import '../widgets/menu_item.dart';

class MyInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyInfoController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8.w, 2.h,8.w, 22.h),
            child: Text(
              '내정보',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(

                children: [



                  ListTile(

                    title: const Text('기본 정보'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Get.toNamed('/basic_info'),
                  ),
                  Divider(height: 6.h, thickness: 0.5, color: Colors.grey.shade400),
                  ListTile(
                    title: const Text('비밀번호 설정'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Get.toNamed('/password'),
                  ),
                  Divider(height: 6.h, thickness: 0.5, color: Colors.grey.shade400),
                  ListTile(
                    title: const Text('캠페인 매칭'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Get.toNamed('/campaign'),
                  ),
                  Divider(height: 6.h, thickness: 0.5, color: Colors.grey.shade400),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}