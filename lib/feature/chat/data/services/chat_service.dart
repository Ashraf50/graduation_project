import 'dart:developer';
import 'package:graduation_project/core/constant/api_keys.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatService {
  io.Socket socket = io.io(
    ApiKeys.realTimeChatUrl,
    io.OptionBuilder()
        .setTransports(['websocket'])
        .setReconnectionAttempts(3)
        .build(),
  );

  void connectSocket(String chatId, Function(dynamic) onMessageReceived) {
    // socket = io.io(
    //   ApiKeys.realTimeChatUrl,
    //   io.OptionBuilder()
    //       .setTransports(['websocket'])
    //       .setReconnectionAttempts(3)
    //       .build(),
    // );
    socket.connect();
    socket.onConnect((_) {
      log('Connected to Socket.io ✅');
      socket.emit('join', chatId);
    });

    socket.onDisconnect((_) {
      log('Disconnected from Socket.io ❌');
    });

    socket.onError((error) {
      log('Socket error: $error ❗');
    });
    socket.onConnectError((error) {
      log('Connection error: $error ❗');
    });
    socket.on('receiveMessage', (data) {
      onMessageReceived(data);
    });
  }

  void sendMessage(String receiverId, String message) {
    // connectSocket(chatId, onMessageReceived)

    if (socket.connected) {
      socket.emit('sendMessage', {
        // "senderId": Supabase.instance.client.auth.currentUser?.id,
        'senderId': ApiKeys.id1,
        "recipientId": receiverId,
        "message": message,
        'timestamp': DateTime.now().toIso8601String(),
      });
      log('messag:$message sendt successfully');
    } else {
      log('Socket is not connected');
    }
  }

  void disconnectSocket() {
    socket.disconnect();
  }
}
