import 'package:flutter/material.dart';

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
      
    );
  }
}
