import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/cubit/date_picker_cubit.dart';
import 'package:task_app/cubit/opacity_cubit.dart';
import 'package:task_app/presentation/utils/date_formatter.dart';

import 'common/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => OpacityCubit()),
            BlocProvider(
              create: (context) => DatePickerCubit(
                dateNow: DateFormatter().getCurrentDate(),
              ),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
