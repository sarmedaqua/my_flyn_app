import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_flyn_app/routes/app_pages.dart';
import '../views/basic_info_view.dart';
import '../views/campaign_view.dart';
import '../views/my_info_view.dart';
import '../views/password_view.dart';
import '../views/splash_view.dart';
import '../views/home_view.dart';

import 'bindings/initial_binding.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  // Initialize core services before app starts
  // This ensures storage is ready when controllers need it
  //await initServices();
  runApp(MyApp());
}

// Future<void> initServices() async {
//   print('Starting services initialization...');
//
//   // Initialize storage service for data persistence
//   // This will be used by controllers to save user data
//   await Get.putAsync(() => StorageService().init());
//
//   print('All services initialized successfully');
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),  // Standard Figma mobile size
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MY FLYN',
          initialBinding: InitialBinding(),
          initialRoute: '/splash',
          getPages: [
            GetPage(name: '/splash', page: () => SplashView(), binding: InitialBinding()),
            GetPage(name: '/home', page: () => HomeView()),
            GetPage(name: '/my_info', page: () => MyInfoView()),
            GetPage(name: '/basic_info', page: () => BasicInfoView()),
            GetPage(name: '/password', page: () => PasswordView()),
            GetPage(name: '/campaign', page: () => CampaignView()),
          ],
          theme: ThemeData(
            primaryColor: const Color(0xFF6A1B9A),  // Purple from splash
            fontFamily: 'NotoSansKR',
            scaffoldBackgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}