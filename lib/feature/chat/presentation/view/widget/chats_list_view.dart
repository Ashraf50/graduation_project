import 'package:flutter/material.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/chat_item.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ChatItem();
      },
    );
  }
}
