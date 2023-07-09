import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/cubit/date_picker_cubit.dart';
import 'package:task_app/presentation/utils/date_formatter.dart';
import 'package:task_app/themes/colors.dart';
import 'package:task_app/themes/text.dart';

import '../widgets/button_costume.dart';
import '../widgets/card_progress.dart';
import 'add_task_page.dart';

class TaskPage extends StatefulWidget {
  static const namePage = "/TaskPage";

  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _DatePageState();
}

class _DatePageState extends State<TaskPage> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToIndex(DateFormatter().getCurrentDate() - 1);
    });
    super.initState();
  }

  void _scrollToIndex(int index) {
    if (_scrollController!.hasClients) {
      final itemWidth = 51.w;
      final viewportWidth = _scrollController!.position.viewportDimension;
      final scrollOffset = _scrollController!.position.minScrollExtent +
          index * itemWidth -
          (viewportWidth - itemWidth) / 2.w;

      _scrollController!.animateTo(
        scrollOffset.clamp(
          _scrollController!.position.minScrollExtent,
          _scrollController!.position.maxScrollExtent,
        ),
        duration: const Duration(milliseconds: 1400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dateCubit = context.read<DatePickerCubit>();
    final dateData = DateFormatter().getDaysOfMonth(6);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: Column(
            children: [
              Container(
                height: 190.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormatter().dateFromatNow(),
                            textScaleFactor: 1,
                            style: blackTextStyle.copyWith(
                              fontSize: 24.sp,
                              fontWeight: semiBold,
                            ),
                          ),
                          CostumeButton(
                            ontap: () => context.push(AddTaskPage.namePage),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: kWhiteColor,
                                  size: 20.r,
                                ),
                                Text(
                                  'Add Task',
                                  textScaleFactor: 1,
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                      width: double.infinity,
                      child: BlocBuilder<DatePickerCubit, int>(
                        builder: (context, state) {
                          return ListView.separated(
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              final isIndex = index == state;
                              return GestureDetector(
                                onTap: () => dateCubit.clickDate(index),
                                child: Container(
                                  width: isIndex ? 64.w : 55.w,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.h,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.h,
                                    ),
                                    decoration: isIndex
                                        ? BoxDecoration(
                                            color: kPrimaryColor.withOpacity(
                                              0.1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              30.h,
                                            ),
                                          )
                                        : const BoxDecoration(),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          dateData[index].substring(0, 2),
                                          style: blackTextStyle.copyWith(
                                            fontSize: 12.sp,
                                            fontWeight: semiBold,
                                            color: isIndex
                                                ? kPrimaryColor
                                                : kTextColor,
                                          ),
                                        ),
                                        Text(
                                          '${index + 1}',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 12.sp,
                                            fontWeight: regular,
                                            color: isIndex
                                                ? kPrimaryColor
                                                : kTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (_, index) => const SizedBox(
                              width: 0,
                            ),
                            itemCount: dateData.length,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 22.h, left: 20.w, bottom: 10.h),
                child: Text(
                  'Tasks',
                  style: blackTextStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CardProgress(),
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(width: 0),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
