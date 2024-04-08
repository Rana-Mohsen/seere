import 'dart:io';
import 'dart:typed_data';

Future<bool> connectToServer({required String ip, required int port}) async {
  try {
    final socket = await Socket.connect(ip, port);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    socket.listen(
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
        print('Server: $serverResponse');
      },
      onError: (error) {
        print(error);
        socket.destroy();
      },
      onDone: () {
        print('Server left.');
        socket.destroy();
      },
    );

    await sendMessage(socket, 'ath1');
    return true;
  } on SocketException catch (e) {
    print('SocketException: $e');
    return false;
  } on OSError catch (e) {
    print('OSError: $e');
    return false;
  } catch (e) {
    print('General exception: $e');
    return false;
  }
}

Future<void> sendMessage(Socket socket, String message) async {
  try {
    message += '\r';
    print('Client: $message');
    socket.write(message);
  } on SocketException catch (e) {
    print('SocketException in sendMessage: $e');
  } catch (e) {
    print('General exception in sendMessage: $e');
  }
}
