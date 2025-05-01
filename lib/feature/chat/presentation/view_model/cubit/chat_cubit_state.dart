part of 'chat_cubit.dart';

sealed class ChatCubitState {}

final class ChatCubitInitial extends ChatCubitState {}

final class GetChatsSuccess extends ChatCubitState {
  final List<ChatModel> chats;
  GetChatsSuccess(this.chats);
}

final class GetChatsLoading  extends ChatCubitState {}
final class GetChatsFailed extends ChatCubitState {
  final String error;
  GetChatsFailed(this.error);
}




final class GetMessagesSuccess extends ChatCubitState {
  final List<MessageModel> messages;
  GetMessagesSuccess(this.messages);
}


final class GetMessagesLoading  extends ChatCubitState {}

final class GetMessagesFailed extends ChatCubitState {
  final String error;
  GetMessagesFailed(this.error);
}
