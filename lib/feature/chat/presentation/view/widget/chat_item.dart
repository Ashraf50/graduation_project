import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/function/get_landlord_by_its_id.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_style.dart';
import '../../../../../core/constant/function/date_format.dart';
// import '../../../../../core/helper/auth_helper.dart';
import '../../../../../core/helper/chat_helper.dart';
import '../../../data/model/chat_model.dart';
import '../../view_model/cubit/chats_cubit.dart';

class ChatItem extends StatefulWidget {
  final ChatModel chat;
  const ChatItem({super.key, required this.chat});

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  final currentUserId = supabase.auth.currentUser!.id;
  String chatTitle = ' ';

  @override
  void initState() {
    super.initState();
    _fetchChatTitle();
  }

  Future<void> _fetchChatTitle() async {
    log('Fetching chat title for   ID: ${widget.chat.id}');
    final title = await getLandLordNameById(widget.chat.users!.last);

    setState(() {
      chatTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.chat.id!),
      direction: DismissDirection.startToEnd,
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white, size: 30),
      ),
      onDismissed: (direction) {
        context.read<ChatCubit>().removeChat(chatId: widget.chat.id!);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 28,
                  child: Text(
                    chatTitle[0],
                    style: AppStyles.textStyle18White,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chatTitle, style: AppStyles.textStyle18black),
                    SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        widget.chat.lastMessage ?? '',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            overflow: TextOverflow.fade),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  dateTimeFormat(
                      widget.chat.lastUpdated!.toString(), 'hh:mm a'),
                  style: AppStyles.textStyle16gray,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  dateTimeFormat(widget.chat.lastUpdated!.toString(), 'dd/M') +
                      '',
                  style: AppStyles.textStyle16gray,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
