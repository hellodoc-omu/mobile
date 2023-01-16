import 'package:socket_io_client/socket_io_client.dart';

class SocketConn {
  late Socket socket;

  SocketConn() {
    socket = io(
      "http://localhost:3000",
      OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
    );
  }

  connectSocket() {
    socket.connect();
  }

  disconnectSocket() {
    socket.disconnect();
    socket.dispose();
  }

  sendEventToServer(String channel, dynamic data) {
    socket.emit(channel, data);
  }

  getEventFromServer(String channel, Function(dynamic) callback) {
    socket.on(channel, callback);
  }
}
