import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/utils/initialize_car_data.dart';
import 'package:seere/views/trouble_scan/cubit/trouble_scan_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../models/dtc_code_model.dart';

class DtcDetailsScreen extends StatefulWidget {
  const DtcDetailsScreen({super.key});

  @override
  State<DtcDetailsScreen> createState() => _DtcDetailsScreenState();
}

class _DtcDetailsScreenState extends State<DtcDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List<DtcCodeModel> dtcDetailsList =
        BlocProvider.of<TroubleScanCubit>(context).dtcDetailsList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dtc Codes"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: ListView.builder(
            itemCount: dtcCodes.length,
            itemBuilder: (context, index) {
              return dtcCard(
                title: dtcDetailsList[index].description ?? "N/A",
                code: dtcDetailsList[index].dtcCode ?? "N/A",
                criticalLevel: dtcDetailsList[index].criticalLevel ?? "N/A",
              );
            },
          )),
    );
  }

  Widget dtcCard(
      {required String title,
      required String code,
      required String criticalLevel}) {
    return Card(
      surfaceTintColor: Colors.white,
      //s color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const Divider(),
              Row(
                children: [
                  const Text(
                    "DTC code: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    code,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Text(
                    "Critical level: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black45),
                  ),
                  Text(
                    criticalLevel,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
