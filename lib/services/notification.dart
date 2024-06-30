import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:seere/utils/initialize_car_data.dart';
import 'package:seere/views/notification/localNotification';

Future<void> predictNotification() async {
  String url = 'https://ai.seere.live/predict';
  Map<String, dynamic> data = {
    "engine_power": requistData["enginePower"],
    "engine_coolant_temp": requistData["engineCoolantTemp"],
    "engine_load": requistData["engineLoad"],
    "engine_rpm": requistData["engineRPM"],
    "air_intake_temp": requistData["airintakeTemp"],
    "speed": requistData["speed"],
    "short_term_fuel_trim": requistData["shortTermFuelBank1"],
    "throttle_pos": requistData["throttlePosition"],
    "timing_advance": requistData["timingAdvance"]
  };

  try {
    debugPrint('Sending request to $url with data: $data');
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data), // Use the json.encode method from dart:convert
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(
          response.body); // Use the json.decode method from dart:convert
      debugPrint('Response received: $responseData');
      var prediction = responseData['code'];
      var severity = responseData['severity'];

      debugPrint('Prediction: $prediction, Severity: $severity');

      if (severity == 'High') {
        showNotification('Issue Detected',
            'An issue with high severity has been detected with your car.');
      }
    } else {
      debugPrint('Failed to get prediction: ${response.statusCode}');
      debugPrint('Response data: ${response.body}');
    }
  } catch (e) {
    debugPrint('Error: $e');
  }
}
