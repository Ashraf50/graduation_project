import '../../../data/model/chat_model.dart';
import '../../../data/model/message.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatModel> chats;
  ChatLoaded({required this.chats});
}

class ChatError extends ChatState {
  final String errMessage;
  ChatError({
    required this.errMessage,
  });
}

class MessageLoading extends ChatState {}

class MessageLoaded extends ChatState {
  final List<MessageModel> messages;
  MessageLoaded({required this.messages});
}

class MessageError extends ChatState {
  final String errMessage;
  MessageError({
    required this.errMessage,
  });
}

class SendingLoading extends ChatState {}

class SendingSuccess extends ChatState {
  final String message;
  SendingSuccess({required this.message});
}

class SendingError extends ChatState {
  final String errMessage;
  SendingError({
    required this.errMessage,
  });
}
