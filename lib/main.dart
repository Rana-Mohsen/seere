import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/constants.dart';
import 'package:seere/views/connaect_device/cubit/connect_device_cubit.dart';
import 'package:seere/views/nav_container.dart';
import 'package:sizer/sizer.dart';

import 'simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: ((context) => ConnectDeviceCubit())),
          
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: kPrimaryBackGroundColor,
          ),
          home: const NavContainer(),
        ),
      );
    });
  }
}
