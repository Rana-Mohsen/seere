import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:seere/constants.dart';
import 'package:seere/views/connect_device/cubit/bluetooth_cubit.dart';
import 'package:seere/views/connect_device/cubit/connect_device_cubit.dart';

import 'package:seere/views/notification/localNotification';
import 'package:seere/views/splash_screen.dart';
import 'package:seere/views/trouble_scan/cubit/trouble_scan_cubit.dart';
import 'package:sizer/sizer.dart';
import 'simple_bloc_observer.dart';
import 'views/home/cubit/data_cubit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  //SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
  //HttpOverrides.global = MyHttpOverrides() as HttpOverrides? ;

  initializeNotifications();
  Bloc.observer = SimpleBlocObserver();

  runApp(Phoenix(child: MyApp()));
  predictIssue();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //getlogged();
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: ((context) => ConnectDeviceCubit())),
          BlocProvider(create: ((context) => DataCubit())),
          BlocProvider(create: ((context) => BluetoothCubit())),
          BlocProvider(create: ((context) => TroubleScanCubit())),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SeerE',
            theme: ThemeData(
              primaryColor: const Color(0xFF235DFF),
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
            home: const SplashScreen()
            // FutureBuilder(
            //   future: Helper.getUserLoggedInSharedPreference(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return  Container(); // Show container while waiting for future to complete
            //     } else {
            //       return Helper.isLogged == true
            //           ? const NavContainer()
            //           : const SplashScreen();
            //     }
            //   },
            // ),
            ),
      );
    });
  }
}
Future<void> predictIssue() async {
  String url = 'https://ai.seere.live/predict';
  Map<String, dynamic> data = {
    "CAR_YEAR": 2015,
    "ENGINE_POWER": 1.6,
    "ENGINE_COOLANT_TEMP": 90.0,
    "ENGINE_LOAD": 0.75,
    "ENGINE_RPM": 3000,
    "AIR_INTAKE_TEMP": 30.0,
    "SPEED": 60,
    "SHORT TERM FUEL TRIM BANK 1": 0.2,
    "THROTTLE_POS": 0.8,
    "TIMING_ADVANCE": 10
  };

  try {
    print('Sending request to $url with data: $data');
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),  // Use the json.encode method from dart:convert
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);  // Use the json.decode method from dart:convert
      print('Response received: $responseData');
      var prediction = responseData['code'];
      var severity = responseData['severity'];

      print('Prediction: $prediction, Severity: $severity');

      if (severity == 'High') {
        showNotification('Issue Detected', 'An issue with high severity has been detected with your car.');
      }
    } else {
      print('Failed to get prediction: ${response.statusCode}');
      print('Response data: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
