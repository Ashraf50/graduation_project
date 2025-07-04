import '../model/chat_model.dart';
import '../model/message.dart';

abstract class ChatRepo {
  Future<List<ChatModel>> getALlChats();
  Future<List<MessageModel>> getMessages({
    required int page,
    required String user1Id,
    required String user2Id,
  });
  Future<String> getChatID({
    required String user1Id,
    required String user2Id,
  });
  Future deleteChat({
    required String chatId,
  });
  Future deleteMessage({
    required String messageId,
  });
}
