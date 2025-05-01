import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/chat/data/models/chat_model.dart';
import 'package:graduation_project/feature/chat/data/models/message_model.dart';
import 'package:graduation_project/feature/chat/data/repo/chat_repo_impl.dart';
import 'package:graduation_project/feature/chat/data/services/chat_service.dart';
part 'chat_cubit_state.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit(this.chatRepoImpl) : super(ChatCubitInitial());
  final ChatRepoImpl chatRepoImpl;

  getChats({required String userId}) async {
    try {
      emit(ChatCubitInitial());
      List<ChatModel> chats = await chatRepoImpl.getChats(userId);
      emit(GetChatsSuccess(chats));
    } catch (e) {
      emit(GetChatsFailed(e.toString()));
    }
  }

  getMessages({required String user1Id, required String user2Id}) async {
    try {
      emit(ChatCubitInitial());
      var data =
          await chatRepoImpl.getMessages(user1Id: user1Id, user2Id: user2Id);
      emit(GetMessagesSuccess(data));
    } catch (e) {
      emit(GetMessagesFailed(e.toString()));
    }
  }

  void connectToChat({required String user1Id, required String user2Id}) async {
    List<MessageModel> messages = [];
    int currentPage = 1;
    bool isFetching = false;
    bool hasMore = true;
    emit(ChatCubitInitial());
    try {
      final chatId =
          await chatRepoImpl.getChatId(user1Id: user1Id, user2Id: user2Id);
      ChatService().connectSocket(chatId, (data) {
        final newMessage = MessageModel.fromJson(data);
        if (!messages.any((msg) =>
            msg.timestamp == newMessage.timestamp &&
            msg.message == newMessage.message)) {
          messages = [newMessage, ...messages];
          emit(GetMessagesSuccess(List.from(messages)));
        }
      });
      currentPage = 1;
      hasMore = true;
      messages.clear();
      // fetchMessages(user1Id: user1Id, user2Id: user2Id, isPagination: false);
    } on Exception catch (e) {
      emit(GetMessagesFailed("Failed to connect to chat: $e"));
    }
  }



  void disconnectSocket() {
    ChatService().disconnectSocket();
  }

 void sendMessage({required String receiverId, required String message}) {
    ChatService().sendMessage(receiverId, message);
  }

  // sendMessage(String message, String senderId, String receiverId) async {
  //   try {
  //     emit(ChatCubitInitial());
  //     await chatRepoImpl.sendMessage(
  //         message: message, senderId: senderId, receiverId: receiverId);
  //     emit(SendMessageSuccess());
  //   } catch (e) {
  //     emit(SendMessageFailed(e.toString()));
  //   }
  // }


}
