import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/colors.dart';
import '../../themes/text.dart';

class CardProgress extends StatelessWidget {
  const CardProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.only(top: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: kWhiteColor,
      ),
      child: Row(
        children: [
          Container(
            height: 45.r,
            width: 45.r,
            padding: EdgeInsets.all(10.r),
            margin: EdgeInsets.only(right: 14.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              gradient: kPrimaryGradient,
            ),
            child: Image.asset("assets/icons/icon_todo.png"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Design Changes',
                textScaleFactor: 1,
                style: blackTextStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Design Changes',
                textScaleFactor: 1,
                style: greyTextStyle.copyWith(
                  fontSize: 10.sp,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(30.r),
            child: Image.asset(
              "assets/icons/icon_dot.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
