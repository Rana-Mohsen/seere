import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:seere/constants.dart';
import 'package:seere/utils/login_helper.dart';
import 'package:seere/views/notification/localNotification';
//import 'package:seere/views/predicted_codes.dart';
import 'package:seere/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyInfoView extends StatefulWidget {
  
  MyInfoView({super.key});

  @override
  State<MyInfoView> createState() => _MyInfoViewState();
}

class _MyInfoViewState extends State<MyInfoView> {
 

  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 25.h,
            width: double.maxFinite,
            child: SvgPicture.asset(
              'assets/images/info_app_bar.svg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  height: 13.h,
                  width: 22.w,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffcfdcfd),
                        Color(0xff5985f9),
                      ],
                    ),
                    //  color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/images/app_icon.png",
                    fit: BoxFit.contain,
                    // width: 23.w,
                  ),
                ),
                Container(
                  height: 15.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffd7e2ff),
                        Color(0xffffffff),
                      ],
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                        color: const Color(0xff042877), width: 0.3.sp),
                    boxShadow: [boxShadow()],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/info_car.png",
                        width: 45.w,
                      ),
                      Text(
                        "Car Name",
                        style: TextStyle(
                          fontFamily: "inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                    // height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/forecast.png",
                                height: 4.h,
                              ),
                              SizedBox(width: 4.5.w),
                              Text(
                                "Start prediction",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              FlutterSwitch(
                                activeColor: kPrimaryBlueColor,
                                width: 65,
                                height: 30,
                                valueFontSize: 15.0,
                                toggleSize: 18.0,
                                value: status,
                                borderRadius: 15.0,
                                padding: 4.0,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    predictIssue();
                                    status = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.info_outline_rounded, size: 8.w),
                          title: const Text("About us"),
                          trailing: GestureDetector(
                            // onTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const CarManagement())),
                            child: const Icon(Icons.arrow_forward_ios_sharp),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        surfaceTintColor: Colors.white,
                        backgroundColor: Colors.white,
                        title: const Text("Log Out!"),
                        actionsOverflowButtonSpacing: 10,
                        actions: [
                          CustomButton(
                            onPressed: () {
                              Helper.saveUserLoggedInSharedPreference(false);
                              Phoenix.rebirth(context);
                            },
                            title: "Continue",
                            color: kPrimaryBlueColor,
                            width: 32,
                          ),
                          CustomButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            title: "Back",
                            color: kPrimaryBlueColor,
                            width: 25,
                          ),
                        ],
                        content:
                            const Text("Are you sure you want to log out?"),
                      ),
                    );
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: kPrimaryBlueColor, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Text(
                        "Log Out",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: kPrimaryBlueColor,
                        ),
                      )),
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

  // Widget customTile(
  //     {required icon1, required title, required icon2, nav, context}) {
  //   return ListTile(
  //     leading: Image.asset(icon1),
  //     title: Text(title),
  //     trailing: GestureDetector(
  //       onTap: () => Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => nav)),
  //       child: Icon(icon2),
  //     ),
  //   );
  // }
}
Future<void> predictIssue() async {
  String url = 'https://ai.seere.live/predict';
  Map<String, dynamic> data = {
    "engine_power": 1.60,
    "engine_coolant_temp": 66.00,
    "engine_load": 0.00,
    "engine_rpm": 0.00,
    "air_intake_temp": -10.00,
    "speed": 0.00,
    "short_term_fuel_trim": 0.00,
    "throttle_pos": 13.00,
    "timing_advance": 52.00
};

  try {
    print('Sending request to $url with data: $data');
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),  
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);  
      print('Response received: $responseData');
      var prediction = responseData['code'];
      var severity = 'High';

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