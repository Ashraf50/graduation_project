class MessageModel {
  final String id;
  final String chatId;
  final String senderId;
  final String message;
  final String timestamp;
  final String createdAt;
  final String updatedAt;
  final int v;

  MessageModel(
      {required this.id,
      required this.chatId,
      required this.senderId,
      required this.message,
      required this.timestamp,
      required this.createdAt,
      required this.updatedAt,
      required this.v});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'],
      chatId: json['chatId'],
      senderId: json['senderId'],
      message: json['message'],
      timestamp: json['timestamp'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'chatId': chatId,
      'senderId': senderId,
      'message': message,
      'timestamp': timestamp,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }


}