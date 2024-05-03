import 'package:flutter/material.dart';
import 'package:seere/widgets/app_center_container.dart';
import 'package:sizer/sizer.dart';

class AppCenterView extends StatelessWidget {
  const AppCenterView({super.key});

  final List<Map<String, String>> _containerData = const [
    {'name': "Component test", 'image': "assets/icons/comp_test.svg"},
    {'name': "Live data", 'image': "assets/icons/live_data2.svg"},
    {'name': "Trouble scan", 'image': "assets/icons/trouble_scan2.svg"},
    {'name': "In-depth check", 'image': "assets/icons/in_depth2.svg"},
    {'name': "Battery check", 'image': "assets/icons/live_data2.svg"},
    {'name': "Performance test", 'image': "assets/icons/live_data2.svg"},
    {'name': "Trip management", 'image': "assets/icons/live_data2.svg"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Application Center",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: Column(
            children: [
              AppCenterContainer(
                isSvg: false,
                image: 'assets/images/center_car.png',
                lable: "Iso car model 1570",
                imgSize: 18,
                hight: 25.1.h,
                width: double.maxFinite,
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Text(
                    "My Tools :",
                    style: TextStyle(
                      color: const Color(0xff042877),
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25),
                  itemCount: _containerData.length,
                  itemBuilder: (context, index) {
                    return AppCenterContainer(
                      image: _containerData[index]['image']!,
                      lable: _containerData[index]['name']!,
                      imgSize: 8,
                      hight: 15.h,
                      width: 40.w,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
