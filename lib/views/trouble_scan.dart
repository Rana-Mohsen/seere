import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seere/constants.dart';
import 'package:seere/views/connect_device/cubit/bluetooth_cubit.dart';
import 'package:seere/widgets/custom_rec_buttom.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_button.dart';

class TroubleScan extends StatefulWidget {
  const TroubleScan({super.key});

  @override
  State<TroubleScan> createState() => _TroubleScanState();
}

class _TroubleScanState extends State<TroubleScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trouble Scannign"),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<BluetoothCubit>(context).send = true;
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/images/last.png"),
            ),
            CustomRecButton(
              child: Text(
                "Scan DTC codes",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
              outerColor: Color(0xff003FE5),
              inerColor: Color(0xff618bf8),
            ),
          ],
        ),
      ),
    );
  }
}
