import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/utils/initialize_car_data.dart';
import 'package:seere/views/connect_device/cubit/bluetooth_cubit.dart';
import 'package:seere/views/notification/localNotification';
import 'package:seere/views/trouble_scan/trouble_scan.dart';
import 'package:seere/widgets/custom_button.dart';
import 'package:seere/widgets/home_container.dart';
import 'package:seere/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../connect_device/connect_device_view.dart';
import '../live_data_view.dart';
import 'cubit/data_cubit.dart';
import 'package:http/http.dart' as http;


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
              width: double.maxFinite,
              child: SvgPicture.asset(
                'assets/images/app_bar2.svg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  onPressed: () {
                    //BlocProvider.of<ConnectDeviceCubit>(context).changeState();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ConnectDeviceView()));
                  },
                  title: "Activate Paried Device",
                  color: kPrimaryBlueColor),
            ),
            SizedBox(
              height: 20.h,
              width: double.infinity,
              child: Image.asset(
                'assets/images/home_car.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    decoration: boxDecoration(),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 2.w,
                        ),
                        customIconButtom(
                          onPressed: () {
                            BlocProvider.of<BluetoothCubit>(context).send =
                                false;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TroubleScan()));
                          },
                          image: "assets/icons/trouble_scan.svg",
                          text: "Trouble Scanning",
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        customIconButtom(
                          onPressed: () {predictIssue();},
                          image: "assets/icons/in_depth.svg",
                          text: "In-depth check",
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        customIconButtom(
                          isSvg: false,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LiveData()));
                          },
                          image: "assets/icons/cloud.png",
                          text: "Live data",
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Driving data",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  BlocBuilder<DataCubit, DataState>(
                    builder: (context, state) {
                      if (state is BlueData || state is WifiData) {
                        // print("====>>>>$requistedData");
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HomeContainer(
                              data: requistedData['speed'],
                              text1: "",
                              text2: "Current speed",
                              text3: "Real-time speed according to OBD data",
                            ),
                            HomeContainer(
                              data: requistedData['engineRPM'],
                              text1: "",
                              text2: "Engine RPM",
                              text3:
                                  "Real-time engine RPM according to OBD data",
                            ),
                          ],
                        );
                      } else {
                        return const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HomeContainer(
                              data: "N/A",
                              text1: "",
                              text2: "Current speed",
                              text3: "Real-time speed according to OBD data",
                            ),
                            HomeContainer(
                              data: "N/A",
                              text1: "",
                              text2: "Engine RPM",
                              text3:
                                  "Real-time engine RPM according to OBD data",
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Trip data",
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 16.sp,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // Container(
                  //   height: 15.h,
                  //   width: double.maxFinite,
                  //   decoration: boxDecoration(),
                  //   child: Image.asset(
                  //     "assets/images/Data.png",
                  //     scale: 1.4,
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customIconButtom(
      {required void Function()? onPressed,
      required String image,
      required String text,
      bool isSvg = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: SizedBox(
          child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: isSvg
                ? SvgPicture.asset(
                    image,
                    height: 4.h,
                  )
                : Image.asset(
                    image,
                    height: 4.h,
                  ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 8.sp,
            ),
          ),
        ],
      )),
    );
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