import 'dart:io';
import 'dart:typed_data';

import 'package:seere/utils/initialize_car_data.dart';

import 'dart:async'; // Import required for Completer

String lastSentMessage = '';

Future<Socket> connectToServer({required String ip, required int port}) async {
  Socket? socket;
  try {
    ConnectionTask<Socket> socketConnectionTask =
        await Socket.startConnect(ip, port);
    socket = await socketConnectionTask.socket;
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    socket.listen(
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
          print('Server: $serverResponse');

        // if (serverResponse.trim() != lastSentMessage.trim()) {
        //   print('Server: $serverResponse');
        // }
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
    sendMessage(socket);
  } on SocketException catch (e) {
    print('SocketException: $e');
  } catch (e) {
    print('General exception: $e');
  }
  return socket!;
}

Future<void> sendMessage(Socket socket) async {
  try {
    for (var key in requistData.keys) {
      String message = requistData[key] + '\r\r';
       print(key);
      print('Client: $message');
      socket.write(message);
      // lastSentMessage = message; // Update the last sent message
         await Future.delayed(const Duration(seconds: 1));
    }
  } on SocketException catch (e) {
    print('SocketException in sendMessage: $e');
  } catch (e) {
    print('General exception in sendMessage: $e');
  }
}
