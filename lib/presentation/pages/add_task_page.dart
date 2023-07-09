import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/cubit/category_cubit.dart';
import 'package:task_app/presentation/widgets/button_costume.dart';
import 'package:task_app/themes/colors.dart';
import 'package:task_app/themes/text.dart';

import '../widgets/button_category.dart';

class AddTaskPage extends StatelessWidget {
  static String namePage = "/AddTaskPage";

  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: kSecondGradient),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 40.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => context.pop(),
                                child: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: kWhiteColor,
                                ),
                              ),
                              Text(
                                'Create a Task',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: bold,
                                ),
                              ),
                              SizedBox(width: 20.w),
                            ],
                          ),
                        ),
                        TextFormFieldCostume(title: 'Name'),
                        SizedBox(height: 30.h),
                        TextFormFieldCostume(title: 'Date'),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 30.h,
                    ),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TimeWidget(title: 'Start Time', time: '01:22 Pm'),
                            SizedBox(width: 60.w),
                            TimeWidget(title: 'Start Time', time: '03:22 Pm'),
                          ],
                        ),
                        Divider(
                          height: 32.h,
                          color: kTextColor.withOpacity(0.5),
                        ),
                        TextFormFieldCostume(
                          title: 'Description',
                          maxLines: 3,
                          colorLines: kTextColor.withOpacity(0.5),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16.h),
                          child: Text(
                            'Category',
                            style: blackTextStyle,
                          ),
                        ),
                        BlocProvider(
                          create: (context) => CategoryCubit(),
                          child: BlocBuilder<CategoryCubit, int>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  ButtonCategory(
                                    title: 'Mobile',
                                    index: 0,
                                    state: state,
                                    buttonColor: kPrimaryColor,
                                  ),
                                  SizedBox(width: 10.w),
                                  ButtonCategory(
                                    title: 'Website',
                                    index: 1,
                                    state: state,
                                    buttonColor: kPrimaryColor,
                                  ),
                                  SizedBox(width: 10.w),
                                  ButtonCategory(
                                    title: 'Testing',
                                    index: 2,
                                    state: state,
                                    buttonColor: kPrimaryColor,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 12.h),
                          child: CostumeButton(
                            ontap: () {},
                            child: Center(
                              child: Text(
                                'Save',
                                style: whiteTextStyle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormFieldCostume extends StatelessWidget {
  const TextFormFieldCostume({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.colorLines = kWhiteColor,
  });

  final String title;
  final int maxLines;
  final Color colorLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: whiteTextStyle.copyWith(color: colorLines),
        ),
        TextFormField(
          maxLines: maxLines,
          cursorColor: colorLines,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: colorLines),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorLines),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorLines),
            ),
          ),
        )
      ],
    );
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.title,
    required this.time,
  });

  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle,
        ),
        SizedBox(height: 8.h),
        Text(
          time,
          style: blackTextStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: semiBold,
          ),
        )
      ],
    );
  }
}
