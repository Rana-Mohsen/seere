import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seere/constants.dart';
import 'package:seere/utils/login_helpper.dart';
import 'package:seere/views/car_management_view.dart';
import 'package:seere/views/registertion/login_package.dart';
import 'package:seere/views/splash_screen.dart';
import 'package:sizer/sizer.dart';

class MyInfoView extends StatelessWidget {
  const MyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 25.h,
            width: double.maxFinite,
            child: Image.asset(
              'assets/images/info_app_bar.png',
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
                    color: Colors.white,
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
                        customTile(
                          icon1: Icons.car_crash_outlined,
                          title: "General settings",
                          icon2: Icons.arrow_forward_ios_sharp,
                          nav: const CarManagement(),
                          context: context,
                        ),
                        customTile(
                          icon1: Icons.car_crash_outlined,
                          title: "Car Management",
                          icon2: Icons.arrow_forward_ios_sharp,
                          nav: const CarManagement(),
                          context: context,
                        ),
                        customTile(
                          icon1: Icons.car_crash_outlined,
                          title: "About us",
                          icon2: Icons.arrow_forward_ios_sharp,
                          nav: const CarManagement(),
                          context: context,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {
                    Helper.saveUserLoggedInSharedPreference(false);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()));
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

  Widget customTile(
      {required icon1, required title, required icon2, nav, context}) {
    return ListTile(
      leading: Icon(icon1),
      title: Text(title),
      trailing: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => nav)),
        child: Icon(icon2),
      ),
    );
  }
}
