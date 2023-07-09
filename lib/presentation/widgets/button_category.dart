import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/category_cubit.dart';
import '../../themes/colors.dart';
import '../../themes/text.dart';

class ButtonCategory extends StatelessWidget {
  const ButtonCategory({
    super.key,
    required this.title,
    required this.index,
    required this.state,
    this.textColor = kTextColor,
    this.buttonColor = kPurpleColor,
    this.buttonSelect = kPurpleColor,
  });

  final String title;
  final int index, state;
  final Color textColor, buttonColor, buttonSelect;

  @override
  Widget build(BuildContext context) {
    final isThis = index == state;
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 45.h,
        child: TextButton(
          onPressed: () => context.read<CategoryCubit>().clickCategory(index),
          style: TextButton.styleFrom(
            backgroundColor:
                isThis ? buttonSelect : buttonColor.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          child: Text(
            title,
            textScaleFactor: 1,
            style: blackTextStyle.copyWith(
              fontSize: 10.sp,
              fontWeight: isThis ? semiBold : medium,
              color: isThis ? textColor : kTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
