import 'package:flutter/material.dart';
import 'package:seere/views/live_data_view.dart';
import 'package:seere/widgets/app_center_container.dart';
import 'package:sizer/sizer.dart';

class AppCenterView extends StatelessWidget {
  const AppCenterView({super.key});

  final List<Map<String, dynamic>> _containerData = const [
    {'name': "Component test", 'image': "assets/icons/comp_test.svg","rout":LiveData()},
    {'name': "Live data", 'image': "assets/icons/live_data2.svg","rout":LiveData()},
    {'name': "Trouble scan", 'image': "assets/icons/trouble_scan2.svg","rout":LiveData()},
    {'name': "In-depth check", 'image': "assets/icons/in_depth2.svg","rout":LiveData()},
    {'name': "Battery check", 'image': "assets/icons/live_data2.svg","rout":LiveData()},
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
                isTap: false,
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
                      rout: _containerData[index]['rout']!,
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
