import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/chat_bubble.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/conversation_appbar.dart';

class ConversationView extends StatefulWidget {
  const ConversationView({super.key});

  @override
  State<ConversationView> createState() => _ConversationViewState();
}

class _ConversationViewState extends State<ConversationView> {
  final messageController = TextEditingController();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const ConversationAppBar(),
      body: ListView(
        controller: _controller,
        // reverse: true,
        children: [
          ChatBubble(massage: "Hello"),
          ChatBubbleFriend(massage: "How are you"),
          ChatBubble(massage: "Hello"),
          ChatBubbleFriend(massage: "How are you"),
          ChatBubble(massage: "Hello"),
          ChatBubbleFriend(massage: "How are you"),
          ChatBubble(massage: "Hello"),
          ChatBubbleFriend(massage: "How are you"),
          ChatBubble(massage: "Hello"),
          ChatBubbleFriend(massage: "How are you"),
          ChatBubble(massage: "Hello"),
          ChatBubbleFriend(
              massage: "How are you How are you How are you How are"),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CustomTextfield(
          hintText: "Send Message",
          controller: TextEditingController(),
          suffixIcon: IconButton(
            onPressed: () {
              messageController.clear();
              _controller.animateTo(
                _controller.position.maxScrollExtent,
                duration: Duration(microseconds: 1),
                curve: Curves.fastOutSlowIn,
              );
            },
            icon: Icon(
              Icons.send_rounded,
              size: 35,
              color: Color(0xff55A99D),
            ),
          ),
        ),
      ),
    );
  }
}
