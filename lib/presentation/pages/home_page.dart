import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/cubit/category_cubit.dart';
import 'package:task_app/cubit/opacity_cubit.dart';
import 'package:task_app/themes/colors.dart';
import 'package:task_app/themes/text.dart';

import '../widgets/button_category.dart';
import '../widgets/card_progress.dart';

class HomePage extends StatelessWidget {
  static const namePage = "/HomePage";

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
      body: SafeArea(
        child: ScrollConfiguration(
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
                                                color: kWhiteColor
                                                    .withOpacity(0.4),
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
                            separatorBuilder: (_, index) =>
                                SizedBox(width: 5.h),
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
      ),
    );
  }
}
