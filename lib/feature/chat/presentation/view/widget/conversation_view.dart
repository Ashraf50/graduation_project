import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/chat_bubble.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: ""),
      body: ListView(
        children: [
          ChatBubble(massage: "Hello"),
          ChatBubbleFriend(massage: "How are you")
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomTextfield(
          hintText: "Send Message",
          controller: TextEditingController(),
          suffixIcon: IconButton(
            onPressed: () {},
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
