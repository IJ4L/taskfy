import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/cubit/category_cubit.dart';
import 'package:task_app/cubit/opacity_cubit.dart';
import 'package:task_app/themes/colors.dart';
import 'package:task_app/themes/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      double scrollOffset = scrollController.offset;
      int scrollIndex = (scrollOffset / 150.h).floor();
      context.read<OpacityCubit>().opacitySwitch(scrollIndex);
    });

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: FractionallySizedBox(
          widthFactor: 0.35.w,
          heightFactor: 0.35.h,
          child: Image.asset(
            "assets/icons/icon_menu.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Ijal!',
                  textScaleFactor: 1,
                  style: blackTextStyle.copyWith(
                    fontSize: 26.sp,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Have a nice days',
                  textScaleFactor: 1,
                  style: greyTextStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: light,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h, bottom: 15.h),
                  child: BlocProvider(
                    create: (context) => CategoryCubit(),
                    child: BlocBuilder<CategoryCubit, int>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            ButtonCategory(
                              title: 'My Tasks',
                              index: 1,
                              state: state,
                            ),
                            const SizedBox(width: 10),
                            ButtonCategory(
                              title: 'In-Progres',
                              index: 2,
                              state: state,
                            ),
                            const SizedBox(width: 10),
                            ButtonCategory(
                              title: 'Completed',
                              index: 3,
                              state: state,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.w,
                  width: double.infinity,
                  child: BlocBuilder<OpacityCubit, int>(
                    builder: (context, state) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return Opacity(
                            opacity: state == index ? 1 : 0.35,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Image.asset(
                                    "assets/images/Card.png",
                                    width: 210.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 25.w,
                                  left: 25.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 35.r,
                                            width: 35.r,
                                            margin:
                                                EdgeInsets.only(right: 10.w),
                                            padding: EdgeInsets.all(6.r),
                                            decoration: BoxDecoration(
                                              color:
                                                  kWhiteColor.withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.r,
                                              ),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                "assets/icons/icon_lamp.png",
                                                width: 120.r,
                                                height: 120.r,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Project ${index + 1}',
                                            textScaleFactor: 1,
                                            style: whiteTextStyle.copyWith(
                                              fontSize: 14.sp,
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: 120.w,
                                        margin: EdgeInsets.symmetric(
                                          vertical: 14.h,
                                        ),
                                        child: Text(
                                          'Front-End Development',
                                          textScaleFactor: 1,
                                          style: whiteTextStyle.copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'October 20, 2020',
                                        textScaleFactor: 1,
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 10.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(width: 12.w),
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        itemCount: 3,
                      );
                    },
                  ),
                ),
                Center(
                  child: Container(
                    height: 8.h,
                    width: 60.w,
                    margin: EdgeInsets.only(top: 16.h, bottom: 20.w),
                    child: BlocBuilder<OpacityCubit, int>(
                      builder: (context, state) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            final isIndex = state == index;
                            return Container(
                              width: isIndex ? 30.w : 8.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                gradient: isIndex
                                    ? kPrimaryGradient
                                    : kDisableGradient,
                              ),
                            );
                          },
                          separatorBuilder: (_, index) => SizedBox(width: 5.h),
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    'Progress',
                    textScaleFactor: 1,
                    style: blackTextStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                const CardProgress(),
                const CardProgress(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class ButtonCategory extends StatelessWidget {
  const ButtonCategory({
    super.key,
    required this.title,
    required this.index,
    required this.state,
  });

  final String title;
  final int index, state;

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
            backgroundColor: isThis ? kWhiteColor : kPurpleColor,
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
            ),
          ),
        ),
      ),
    );
  }
}