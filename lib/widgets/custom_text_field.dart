

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final bool enabled;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    required this.label,
    this.hint,
    required this.controller,
    this.enabled = true,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    // Split label to apply red color on *
    final parts = label.split('*');

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Label with bold text + red asterisk
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: parts[0].trim()),
                if (label.contains('*'))
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 6.h),

          // ✅ TextField
          TextField(
            controller: controller,
            enabled: enabled,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]), // light grey placeholder
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey[300]!), // light grey border
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey[500]!), // slightly darker on focus
              ),
            ),
          ),
        ],
      ),
    );
  }
}
