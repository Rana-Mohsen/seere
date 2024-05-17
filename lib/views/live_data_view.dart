import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class LiveData extends StatefulWidget {
  const LiveData({super.key});

  @override
  State<LiveData> createState() => _LiveDataState();
}

class _LiveDataState extends State<LiveData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OBD live data"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  dataContainer(),
                  dataContainer(),
                  dataContainer(),
                  dataContainer(),
                  dataContainer(),
                ],
              ),
              SvgPicture.asset("assets/images/live_data_car.svg"),
            ],
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }

  Widget dataContainer() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              children: [
                TextSpan(text: '0', style: TextStyle(fontSize: 16.sp)),
                TextSpan(
                    text: 'km/h',
                    style: TextStyle(fontSize: 8.sp, color: Colors.black54)),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset("assets/icons/live_data_current_speed.svg"),
              Text("Current Speed",
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
