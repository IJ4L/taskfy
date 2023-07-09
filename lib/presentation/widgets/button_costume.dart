import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/colors.dart';

class CostumeButton extends StatelessWidget {
  const CostumeButton({
    super.key,
    required this.ontap,
    required this.child,
  });

  final Function() ontap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: kPrimaryGradient,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: ontap,
          borderRadius: BorderRadius.circular(20.w),
          child: Container(
            height: 46.h,
            width: 120.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: child,
          ),
        ),
      ),
    );
  }
}
