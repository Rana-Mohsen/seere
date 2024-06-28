import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seere/constants.dart';
import 'package:seere/utils/initialize_car_data.dart';
import 'package:seere/views/connect_device/cubit/bluetooth_cubit.dart';
import 'package:seere/views/trouble_scan/cubit/trouble_scan_cubit.dart';
import 'package:seere/views/trouble_scan/dtc_details.dart';
import 'package:seere/widgets/custom_rec_buttom.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_button.dart';

class TroubleScan extends StatefulWidget {
  const TroubleScan({super.key});
  @override
  State<TroubleScan> createState() => _TroubleScanState();
}

class _TroubleScanState extends State<TroubleScan> {
  bool buttonNav = false;
  bool buttonColor = false;

  @override
  Widget build(BuildContext context) {
    var troubleBloc = BlocProvider.of<TroubleScanCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trouble Scanning"),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<BluetoothCubit>(context).send = true;
            dtcCodes = [];
            BlocProvider.of<TroubleScanCubit>(context).initialState();
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/images/pngegg.png"),
            ),
            BlocConsumer<TroubleScanCubit, TroubleScanState>(
              listener: (context, state) {
                if (state is DtcResultPos || state is DtcResultNeg) {
                  buttonNav = true;
                }
              },
              builder: (context, state) {
                // Define colors based on the state
                Color outerColor = state is DtcResultPos
                    ? const Color(0xffFF5C00)
                    : const Color(0xff003FE5);
                Color inerColor = state is DtcResultPos
                    ? const Color(0xffFFD600)
                    : const Color(0xff618bf8);
                if (state is RequistDtc) {
                  BlocProvider.of<BluetoothCubit>(context).send = false;
                } else {
                  if (BlocProvider.of<BluetoothCubit>(context).send == false) {
                    BlocProvider.of<BluetoothCubit>(context).send = true;
                    BlocProvider.of<BluetoothCubit>(context)
                        .sendParameterRequiest(paramJSON);
                  }
                }

                return CustomRecButton(
                  onTap: () {
                    if (buttonNav) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DtcDetailsScreen()));
                    } else {
                      BlocProvider.of<BluetoothCubit>(context)
                          .sendDtcRequiest(dtcJSON)
                          .then((value) => troubleBloc.buttonPressed());
                    }
                  },
                  outerColor: outerColor,
                  inerColor: inerColor,
                  child: Center(
                    child: state is RequistDtc
                        ? SizedBox(
                            height: 3.h,
                            child: Image.asset("assets/images/frogcarspin.gif"))
                        // const CircularProgressIndicator(
                        //     color: kPrimaryBlueColor,
                        //   )
                        : state is DtcResultPos
                            ? Text(
                                "${dtcCodes!.length} Dtc detected",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                ),
                              )
                            : state is DtcResultNeg
                                ? Text(
                                    "0 detected",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    "Scan DTC codes",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 4.h,
            ),
            GestureDetector(
              onTap: () {},
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
                    "Clear dtc Codes",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: kPrimaryBlueColor,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
