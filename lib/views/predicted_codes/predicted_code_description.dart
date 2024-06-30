import 'package:flutter/material.dart';
import 'package:seere/models/dtc_code_model.dart';
import 'package:seere/models/prediction_model.dart';
import 'package:seere/utils/initialize_car_data.dart';
import 'package:seere/widgets/dtc_card.dart';

class PredictedCodeDescription extends StatelessWidget {
  const PredictedCodeDescription(
      {super.key, required this.index});
  //final PredictionModel predictioinDesc;
  final int index;
  @override
  Widget build(BuildContext context) {
      dynamic data = predictedCodesList!.data[predictedCodesList!.code[index]];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Code description"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DtcCard(
              title: data!.description,
              code: data!.dtcCode,
              criticalLevel: data!.criticalLevel,
            ),
            textPara(
                header: "Estimated hours to failure", body: predictedCodesList!.estimatedHours.toString()),
            textPara(
                header: "Code description", body: data.longDescription),
            textPara(header: "Reasons for fault", body: data.reason),
            textPara(header: "Repairing suggestions", body: data.repair),
          ],
        ),
      ),
    );
  }

  Widget textPara({required String header, required String? body}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child:
              Text(header, style: const TextStyle(fontWeight: FontWeight.w600)),
        ),
        Text(
          body ?? "N/A",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
