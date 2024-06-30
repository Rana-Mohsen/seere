import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/constants.dart';
import 'package:seere/utils/initialize_car_data.dart';
import 'package:seere/views/notification/localNotification';
import 'package:seere/views/predicted_codes/cubit/predict_codes_cubit.dart';
import 'package:seere/views/predicted_codes/predicted_code_description.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/dtc_card.dart';

class PredictedCodes extends StatefulWidget {
  const PredictedCodes({super.key});

  @override
  State<PredictedCodes> createState() => _PredictedCodesState();
}

class _PredictedCodesState extends State<PredictedCodes> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Predicted Codes"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: BlocBuilder<PredictCodesCubit, PredictCodesState>(
            builder: (context, state) {
              // if (state is PredictedCodes) {

              // }
              if (state is NoPrediction) {
                debugPrint(state.toString());
                return const Center(
                  child: Text("No issues detected"),
                );
              } else {
                return ListView.builder(
                  itemCount: predictedCodesList!.code.length,
                  itemBuilder: (context, index) {
                    return DtcCard(
                      title: predictedCodesList!
                          .data[predictedCodesList!.code[index]]!.description,
                      code: predictedCodesList!
                          .data[predictedCodesList!.code[index]]!.dtcCode,
                      criticalLevel: predictedCodesList!
                          .data[predictedCodesList!.code[index]]!.criticalLevel,
                      icon: GestureDetector(
                        child: SizedBox(
                            width: 5.w,
                            child: const Icon(Icons.arrow_forward_ios_rounded)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PredictedCodeDescription(index: index),
                              ));
                        },
                      ),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
