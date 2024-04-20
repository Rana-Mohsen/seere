import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/constants.dart';
//import 'package:seere/constants.dart';
import 'package:seere/views/connaect_device/cubit/bluetooth_cubit.dart';
import 'package:seere/views/connaect_device/cubit/connect_device_cubit.dart';
import 'package:seere/views/nav_container.dart';
//import 'package:seere/views/nav_container.dart';
import 'package:seere/views/splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'simple_bloc_observer.dart';
import 'views/home/cubit/data_cubit.dart';

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
          BlocProvider(create: ((context) => DataCubit())),
          BlocProvider(create: ((context) => BluetoothCubit())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SeerE',
          theme: ThemeData(
            primaryColor: Color(0xFF235DFF),
            scaffoldBackgroundColor: kPrimaryBackGroundColor,
            textSelectionTheme:
                const TextSelectionThemeData(cursorColor: Colors.white),
            fontFamily: 'SourceSansPro',
            textTheme: const TextTheme(
              displaySmall: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 45.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              labelLarge: TextStyle(
                // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
                fontFamily: 'OpenSans',
              ),
              bodySmall: TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Color(0xFF235DFF),
              ),
              displayLarge: TextStyle(fontFamily: 'Quicksand'),
              displayMedium: TextStyle(fontFamily: 'Quicksand'),
              headlineMedium: TextStyle(fontFamily: 'Quicksand'),
              headlineSmall: TextStyle(fontFamily: 'NotoSans'),
              titleLarge: TextStyle(fontFamily: 'NotoSans'),
              titleMedium: TextStyle(fontFamily: 'NotoSans'),
              bodyLarge: TextStyle(fontFamily: 'NotoSans'),
              bodyMedium: TextStyle(fontFamily: 'NotoSans'),
              titleSmall: TextStyle(fontFamily: 'NotoSans'),
              labelSmall: TextStyle(fontFamily: 'NotoSans'),
            ),
          ),
           home:  const SplashScreen(),//NavContainer()
        ),
      );
    });
  }
}
