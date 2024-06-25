import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DtcDetailsScreen extends StatefulWidget {
  const DtcDetailsScreen({super.key});

  @override
  State<DtcDetailsScreen> createState() => _DtcDetailsScreenState();
}

class _DtcDetailsScreenState extends State<DtcDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dtc Codes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          children: [
            dtcCard(),
          ],
        ),
      ),
    );
  }

  Widget dtcCard() {
    return const Card(
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
                "kklklppppppppkkl;klk;lklk;s",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    "DTC code: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    "ppopo",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    "DTC code: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black45),
                  ),
                  Text(
                    "ppopo",
                    style: TextStyle(fontWeight: FontWeight.w600),
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
