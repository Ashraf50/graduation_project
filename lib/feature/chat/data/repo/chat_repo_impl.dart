import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:graduation_project/core/constant/api_keys.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/feature/chat/data/models/chat_model.dart';
import 'package:graduation_project/feature/chat/data/models/message_model.dart';
import 'package:graduation_project/feature/chat/data/repo/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final ApiHelper apiHelper;
  ChatRepoImpl(this.apiHelper);
  @override
  Future<List<ChatModel>> getChats(String userId) async {
    try {
      Response response = await apiHelper.get(
        '${ApiKeys.chatBaseUrl}${ApiKeys.chatGetChatsUrl}apiKey=${ApiKeys.chatApiKey}',
      );
      List<ChatModel> chats = [];
      if (response.statusCode == 200) {
        for (var chat in response.data['chats']) {
          chats.add(ChatModel.fromJson(chat));
        }

        log(chats.toString());
      } else {
        log('Error: ${response.statusCode}');
      }
      return chats;
    } catch (e) {
      log(e.toString());
      throw Exception('Error fetching chats ');
    }
  }

  @override
  Future<void> sendMessage(
      {required String message,
      required String senderId,
      required String receiverId}) async {
    try {
      Response<dynamic> response = await apiHelper.post(
        //{{chat_url}}/api/messages?apiKey={{apiKey}}
        '${ApiKeys.chatBaseUrl}${ApiKeys.chatSendMessageUrl}apiKey=${ApiKeys.chatApiKey}',
        {
          'senderId': senderId,
          'recipientId': receiverId,
          'message': message,
          'timestamp': "2025-02-09T12:30:00Z",
        },
      );

      if (response.statusCode == 200) {
        log('Message sent successfully: ${response.data['data']}');
      } else {
        log('Error sending message: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error sending message: $e');
    }
  }

  @override
  Future<List<MessageModel>> getMessages(
      {required String user1Id, required String user2Id}) async {
    try {
      Response response = await apiHelper.get(
          '${ApiKeys.chatBaseUrl}${ApiKeys.chatGetMessagesUrl}apiKey=${ApiKeys.chatApiKey}&user1Id=$user2Id&user2Id=$user2Id');

      final List<MessageModel> data = [];
      if (response.statusCode == 200) {
        for (var message in response.data['messages']) {
          data.add(MessageModel.fromJson(message));
        }

        log(data.toString());
      }
      return data;
    } catch (e) {
      log(e.toString());
      throw Exception('Error fetching chats ');
    }
  }

  @override
  Future<String> getChatId(
      {required String user1Id, required String user2Id}) async {
    try {
      Response response = await apiHelper.get(
        '${ApiKeys.chatBaseUrl}${ApiKeys.chatGetChatId}apiKey=${ApiKeys.chatApiKey}&user1Id=$user1Id&user2Id=$user2Id',
      );

      if (response.statusCode == 200) {
        return response.data['chatId'];
      } else {
        log('Error: ${response.statusCode}');
        throw Exception('Error fetching chat ID: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Error fetching chat ID: $e');
    }
  }
}
