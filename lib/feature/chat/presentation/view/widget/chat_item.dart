import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/Auth/data/manager/auth_supabase_manager.dart';
import 'package:graduation_project/feature/chat/data/models/chat_model.dart';
import 'package:graduation_project/feature/chat/presentation/view_model/cubit/chat_cubit.dart';

class ChatItem extends StatefulWidget {
  const ChatItem({super.key, required this.chat});
  final ChatModel chat;

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  String userName = '';
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await getUserNameById('8569fca5-dd8b-4ab9-9145-b70774db980e');
    });

    super.initState();
  }

  String formatToUUID(String input) {
    if (input.length != 32) {
      throw FormatException('Input must be 32 characters long.');
    }
    return '${input.substring(0, 8)}-'
        '${input.substring(8, 12)}-'
        '${input.substring(12, 16)}-'
        '${input.substring(16, 20)}-'
        '${input.substring(20)}';
  }

  Future<String> getUserNameById(String id) async {
    final data = await supabase.from('User').select('''
   username
  ''').eq('id', id).single();
    userName = data['username'];
    setState(() {});

    return data['username'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          // getUserNameById(widget.chat.users.last);
          // BlocProvider.of<ChatCubit>(context)
          //     .getMessages(chat.users.first, chat.users.last);
          context.push('/conversation_view');
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/img/test.jpg'),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: AppStyles.textStyle18black,
                ),
                Text(widget.chat.lastMessage),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
