class ChatModel {
/**
 "_id": "6806761a93c2bddf0fa8ae63",
            "users": [
                "67a2aa1d025d33644c5bc5c6",
                "67a34e98d73da2744ebdbc17"
            ],
            "lastMessage": "How are you",
            "lastUpdated": "2025-02-09T12:30:00.000Z",
            "__v": 0
 */

  final String id;
  final List<String> users;
  final String lastMessage;
  final String lastUpdated;
  final int v;

  ChatModel(
      {required this.id,
      required this.users,
      required this.lastMessage,
      required this.lastUpdated,
      required this.v});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['_id'],
      users: List<String>.from(json['users']),
      lastMessage: json['lastMessage'],
      lastUpdated: json['lastUpdated'],
      v: json['__v'],
    );
  }

  @override
  toString() {
    return 'ChatModel(id: $id, users: $users, lastMessage: $lastMessage, lastUpdated: $lastUpdated, v: $v)';
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'users': users,
      'lastMessage': lastMessage,
      'lastUpdated': lastUpdated,
      '__v': v,
    };
  }
}
