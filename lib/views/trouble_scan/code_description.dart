import 'package:flutter/material.dart';
import 'package:seere/models/dtc_code_model.dart';
import 'package:seere/widgets/dtc_card.dart';

class CodeDescription extends StatelessWidget {
  const CodeDescription({super.key, required this.codeDesc});
  final DtcCodeModel codeDesc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Code description"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          children: [
            DtcCard(
              code: codeDesc.dtcCode ?? "N/A",
              title: codeDesc.description ?? "N/A",
              criticalLevel: codeDesc.criticalLevel ?? "N/A",
            ),
            const Text("Code description"),
            Text(
              codeDesc.longDescription ?? "N/A",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black45,
              ),
            ),
            const Text("Reasons for fault"),
            Text(
              codeDesc.reason ?? "N/A",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black45,
              ),
            ),
            const Text("Repairing suggestions"),
            Text(
              codeDesc.repair ?? "N/A",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
