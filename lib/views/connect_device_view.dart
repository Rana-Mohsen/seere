import 'package:flutter/material.dart';

class ConnectDeviceView extends StatefulWidget {
  const ConnectDeviceView({super.key});

  @override
  State<ConnectDeviceView> createState() => _ConnectDeviceViewState();
}

class _ConnectDeviceViewState extends State<ConnectDeviceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Connectivity")),
      ),
    );
  }
}