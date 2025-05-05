import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/feature/chat/data/models/chat_model.dart';
import 'package:graduation_project/feature/chat/data/models/message_model.dart';

abstract class ChatRepo {
  Future<void> sendMessage(
      {required String message,
      required String senderId,
      required String receiverId});
  Future<List<MessageModel>> getMessages(
      {required String user1Id, required String user2Id});
  Future<List<ChatModel>> getChats(String userId);

  Future<String> getChatId({required String user1Id, required String user2Id});
  
}
