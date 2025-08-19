import 'package:get/get.dart';
import '../bindings/initial_binding.dart';
import '../views/basic_info_view.dart';
import '../views/campaign_view.dart';
import '../views/my_info_view.dart';
import '../views/password_view.dart';
import '../views/splash_view.dart';
import '../views/home_view.dart';

class AppPages {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => SplashView(), binding: InitialBinding()),
    GetPage(name: '/home', page: () => HomeView()),
    GetPage(name: '/my_info', page: () => MyInfoView()),
    GetPage(name: '/basic_info', page: () => BasicInfoView()),
    GetPage(name: '/password', page: () => PasswordView()),
    GetPage(name: '/campaign', page: () => CampaignView()),
  ];
}