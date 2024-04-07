import 'dart:io';
import 'dart:typed_data';

Future<bool> connectToServer({required String ip, required int port}) async {
  // connect to the socket server
  try {
    final socket = await Socket.connect(ip, port);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    // listen for responses from the server
    socket.listen(
      // handle data from the server
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
        print('Server: $serverResponse');
      },

      // handle errors
      onError: (error) {
        print(error);
        socket.destroy();
      },

      // handle server ending connection
      onDone: () {
        print('Server left.');
        socket.destroy();
      },
    );

    // send some messages to the server
    await sendMessage(socket, 'ath1');
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<void> sendMessage(Socket socket, String message) async {
  message += '\r';
  print('Client: $message');
  socket.write(message);
  // await Future.delayed(Duration(seconds: 2));
}
