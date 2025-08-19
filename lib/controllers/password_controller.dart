import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void updatePassword() {
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }
    // Validation: length 8-16, etc. (add regex)
    if (newPasswordController.text.length < 8 || newPasswordController.text.length > 16) {
      Get.snackbar('Error', 'Password must be 8-16 characters');
      return;
    }
    Get.back();
    Get.snackbar('Success', 'Password updated');
  }
}