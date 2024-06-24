import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seere/constants.dart';
import 'package:seere/utils/initialize_car_data.dart';
import 'package:seere/views/connect_device/cubit/bluetooth_cubit.dart';
import 'package:seere/views/trouble_scan/cubit/trouble_scan_cubit.dart';
import 'package:seere/widgets/custom_rec_buttom.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_button.dart';

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
        title: const Text("Trouble Scanning"),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<BluetoothCubit>(context).send = true;
            dtcCodes = null;
            BlocProvider.of<TroubleScanCubit>(context).initialState();
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
              onTap: () {
                BlocProvider.of<BluetoothCubit>(context)
                    .sendDtcRequiest(dtcJSON)
                    .then((value) => BlocProvider.of<TroubleScanCubit>(context)
                        .buttonPressed());
              },
              outerColor: Color(0xff003FE5),
              inerColor: Color(0xff618bf8),
              child: Center(
                child: BlocBuilder<TroubleScanCubit, TroubleScanState>(
                  builder: (context, state) {
                    if (state is RequistDtc) {
                      return const CircularProgressIndicator(
                        color: kPrimaryBlueColor,
                      );
                    } else if (state is DtcResultPos) {
                      return Text(
                        "${dtcCodes!.length} detected",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      );
                    } else if (state is DtcResultNeg) {
                      return Text(
                        "0 detected",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Text(
                        "Scan DTC codes",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
