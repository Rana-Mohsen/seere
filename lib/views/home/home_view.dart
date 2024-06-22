import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/utils/initialize_car_data.dart';
import 'package:seere/views/trouble_scan.dart';
import 'package:seere/widgets/custom_button.dart';
import 'package:seere/widgets/home_container.dart';
import 'package:seere/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../connect_device/connect_device_view.dart';
import '../live_data_view.dart';
import 'cubit/data_cubit.dart';

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
                          onPressed: () {},
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
                    child: Image.asset(
                      "assets/images/Data.png",
                      scale: 1.4,
                    ),
                  )
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
