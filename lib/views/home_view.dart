import 'package:flutter/material.dart';
import 'package:seere/components/custom_button.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
                title: "Activate Paried Device", color: Color(0xff2F66F6)),
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
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
