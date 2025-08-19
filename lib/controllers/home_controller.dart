import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  RxString userName = '홍길동'.obs;
  Rx<File?> profileImage = Rx<File?>(null);
  RxInt applications = 0.obs;
  RxInt inProgress = 0.obs;
  RxInt completed = 0.obs;

  Future<void> uploadProfileImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
      } else {
        Get.snackbar('취소됨', '이미지를 선택하지 않았습니다.');
      }
    } catch (e) {
      Get.snackbar('에러', '이미지 선택 중 오류가 발생했습니다: $e');
    }
  }


  void logout() {
    // Logic, e.g., clear data and navigate to login (if exists)
    Get.offAllNamed('/splash');
  }
}