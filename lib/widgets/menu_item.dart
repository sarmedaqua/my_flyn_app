
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget menuItem(IconData icon, String title,
    {VoidCallback? onTap, Color? color}) {
  return Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: color ?? Colors.black87),

        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            color: color ?? Colors.black,
            fontWeight: FontWeight.w500,

          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: onTap,

      ),
      Divider(height: 6.h, thickness: 0.5, color: Colors.grey.shade400),
    ],
  );
}