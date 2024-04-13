import 'package:flutter/material.dart';
import 'package:seere/services/socket.dart';
import 'package:seere/widgets/custom_button.dart';
import 'package:seere/widgets/home_container.dart';
import 'package:seere/constants.dart';
import 'package:sizer/sizer.dart';

import 'connaect_device/connect_device_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Stream<Map<String, String>> get dataStream => streamController.stream;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
            width: double.maxFinite,
            child: Image.asset(
              'assets/images/appbar.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
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
                        onPressed: () {},
                        image: "assets/icons/trouble_scanning_icon.png",
                        text: "Trouble Scanning",
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      customIconButtom(
                        onPressed: () {},
                        image: "assets/icons/trouble_scanning_icon.png",
                        text: "In-depth check",
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      customIconButtom(
                        onPressed: () {},
                        image: "assets/icons/live_data.png",
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
                StreamBuilder<Map<String, String>>(
                  stream: dataStream, // Replace with the actual stream
                  builder: (BuildContext context,
                      AsyncSnapshot<Map<String, String>> snapshot) {
                    if (snapshot.hasData) {
                      String speed = snapshot.data!['speed'] ?? 'N/A';
                      String engineRPM = snapshot.data!['engineRPM'] ?? 'N/A';
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeContainer(
                            data: speed,
                            text1: "km/h",
                            text2: "Current speed",
                            text3: "Real-time speed according to OBD data",
                          ),
                          HomeContainer(
                            data: engineRPM,
                            text1: "RPM",
                            text2: "Engine RPM",
                            text3: "Real-time engine RPM according to OBD data",
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator(); // Show a loading spinner while waiting for data
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Text(
                      "Trip data",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 15.h,
                  width: double.maxFinite,
                  decoration: boxDecoration(),
                  child: Image.asset("assets/images/trip_data.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customIconButtom(
      {required void Function()? onPressed,
      required String image,
      required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: SizedBox(
          child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Image.asset(
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
