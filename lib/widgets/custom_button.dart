import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const CustomButton({required this.text, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? const Color(0xFF6A1B9A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}