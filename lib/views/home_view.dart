import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/components/custom_button.dart';
import 'package:seere/components/home_container.dart';
import 'package:seere/constants.dart';
import 'package:seere/views/connaect_device/cubit/connect_device_cubit.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomButton(
                title: "Activate Paried Device", color: kPrimaryBlueColor),
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
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeContainer(
                        data: "50",
                        text1: "L/100Km",
                        text2: "Current estimated fuel consumption",
                        text3: "Real-time calculated according to OBD data",
                      ),
                      HomeContainer(
                        data: "50",
                        text1: "L/100Km",
                        text2: "Current estimated fuel consumption",
                        text3: "Real-time calculated according to OBD data",
                      ),
                    ]),
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
