import 'dart:io';
import 'dart:typed_data';

import 'package:seere/utils/initialize_car_data.dart';

import 'dart:async';

import '../models/car_data.dart'; // Import required for Completer

String lastSentMessage = '';
Socket? socket;

Future<Socket> connectToServer({required String ip, required int port}) async {
  try {
    ConnectionTask<Socket> socketConnectionTask =
        await Socket.startConnect(ip, port);
    socket = await socketConnectionTask.socket;
    print(
        'Connected to: ${socket!.remoteAddress.address}:${socket!.remotePort}');

    // socket!.listen(
    //   (Uint8List data) {
    //     final serverResponse = String.fromCharCodes(data);
    //     // print('Server: $serverResponse');
    //     // Split the response into lines
    //     List<String> lines = serverResponse.split('\n');

    //     // Iterate over each line
    //     for (String line in lines) {
    //       // Trim whitespace and split the line into parts
    //       List<String> parts = line.trim().split(' ');

    //       // Check if the line is a response to a current data request
    //       if (parts.length > 2 && parts[0] == '41') {
    //         // The second part is the PID, and the remaining parts are the value
    //         String pid = parts[1];
    //         String value = parts.sublist(2).join(' ');
    //         cardata.add(value);

    //         // if (serverResponse.trim() != lastSentMessage.trim()) {
    //         //   print('Server: $serverResponse');
    //         // }
    //       }
    //     }
    //   },
    //   onError: (error) {
    //     print(error);
    //     socket!.destroy();
    //   },
    //   onDone: () {
    //     print('Server left.');
    //     socket!.destroy();
    //   },
    // );
    // sendMessage(socket!);
  } on SocketException catch (e) {
    print('SocketException: $e');
  } catch (e) {
    print('General exception: $e');
  }
  return socket!;
}

Future<void> reciveData() async {
  socket!.listen(
    (Uint8List data) {
      final serverResponse = String.fromCharCodes(data);
      // print('Server: $serverResponse');
      // Split the response into lines
      List<String> lines = serverResponse.split('\n');

      // Iterate over each line
      for (String line in lines) {
        // Trim whitespace and split the line into parts
        List<String> parts = line.trim().split(' ');

        // Check if the line is a response to a current data request
        if (parts.length > 2 && parts[0] == '41') {
          // The second part is the PID, and the remaining parts are the value
          String pid = parts[1];
          String value = parts.sublist(2).join(' ');
          cardata.add(value);
          print(value);

          // if (serverResponse.trim() != lastSentMessage.trim()) {
          //   print('Server: $serverResponse');
          // }
        }
      }
    },
    onError: (error) {
      print(error);
      socket!.destroy();
    },
    onDone: () {
      print('Server left.');
      socket!.destroy();
    },
  );
  sendMessage(socket!);
}

Future<void> sendMessage(Socket socket) async {
  try {
    for (var key in requistData.keys) {
      String message = requistData[key] + '\r\n\r\n';
      print(key);
      print('Client: $message');
      socket.write(message);
      // lastSentMessage = message; // Update the last sent message
      await Future.delayed(const Duration(seconds: 3));
    }
  } on SocketException catch (e) {
    print('SocketException in sendMessage: $e');
  } catch (e) {
    print('General exception in sendMessage: $e');
  }
}

// void main() {
//   connectToServer(ip: "192.168.1.6", port: 35000);
// }
