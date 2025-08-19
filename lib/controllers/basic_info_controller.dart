


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class BasicInfoController extends GetxController {
  final TextEditingController idController =
  TextEditingController(text: 'asdf123');
  final TextEditingController emailController =
  TextEditingController(text: 'asdf123@naver.com');
  final TextEditingController phoneController =
  TextEditingController(text: '010-1234-5678');
  final TextEditingController nicknameController =
  TextEditingController(text: '장발산');
  final TextEditingController instagramController =
  TextEditingController(text: 'ffkdo_sa');
  final TextEditingController linkController =
  TextEditingController(text: 'https://www.naver.com/');

  /// Portfolio file name
  RxString portfolioPath = '포트폴리오.pdf'.obs;

  /// Tracks if form is valid
  RxBool isFormValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Watch controllers for changes
    emailController.addListener(_validateForm);
    phoneController.addListener(_validateForm);
    nicknameController.addListener(_validateForm);
    instagramController.addListener(_validateForm);
    linkController.addListener(_validateForm);
  }

  void _validateForm() {
    final isValid = emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        nicknameController.text.isNotEmpty &&
        instagramController.text.isNotEmpty &&
        linkController.text.isNotEmpty &&
        portfolioPath.value.isNotEmpty;

    isFormValid.value = isValid;
  }

  Future<void> pickPortfolio() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        portfolioPath.value = result.files.single.name;
        _validateForm();
      } else {
        Get.snackbar('취소됨', '파일이 선택되지 않았습니다');
      }
    } catch (e) {
      Get.snackbar('에러', '파일 선택 중 오류가 발생했습니다: $e');
    }
  }


  Future<bool> _requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) return true;
    Get.snackbar('권한 거부됨', 'PDF 업로드를 위해 저장소 접근 권한을 허용해주세요');
    return false;
  }

  void verifyPhone() {
    Get.snackbar('인증 완료', '휴대폰 번호가 확인되었습니다');
  }

  void saveBasicInfo() {
    Get.back();
    Get.snackbar('저장됨', '기본 정보가 업데이트되었습니다');
  }
}
