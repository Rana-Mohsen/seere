import 'package:flutter/material.dart';
import 'package:seere/utils/initialize_car_data.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/dtc_card.dart';

class PredictedCodes extends StatelessWidget {
  const PredictedCodes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Predicted Codes"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: ListView.builder(
            itemCount: predictedCodesList.length,
            itemBuilder: (context, index) {
              return DtcCard(
                title: "N/A",
                code: "N/A",
                criticalLevel: "N/A",
                icon: GestureDetector(
                  child: SizedBox(
                      width: 5.w,
                      child: const Icon(Icons.arrow_forward_ios_rounded)),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           CodeDescription(codeDesc: dtcDetailsList[index]),
                    //     ));
                  },
                ),
              );
            },
          )),
    );
  }
}
