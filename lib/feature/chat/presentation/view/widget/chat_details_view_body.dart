import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/helper/auth_helper.dart';
import '../../../../../core/widget/custom_app_bar.dart';
import '../../../../../core/widget/custom_scaffold.dart';
import '../../view_model/cubit/chats_cubit.dart';
import 'messages_list.dart';

class ChatDetailsViewBody extends StatefulWidget {
  final List usersId;
  const ChatDetailsViewBody({
    super.key,
    required this.usersId,
  });

  @override
  State<ChatDetailsViewBody> createState() => _ChatDetailsViewBodyState();
}

class _ChatDetailsViewBodyState extends State<ChatDetailsViewBody> {
  final TextEditingController _controller = TextEditingController();
  bool _isNotEmpty = false;
  late ChatCubit chatCubit;
  final currentUserId = Supabase.instance.client.auth.currentUser!.id;
  String chatTitle = "Loading...";

  @override
  void initState() {
    super.initState();
    chatCubit = context.read<ChatCubit>();
    chatCubit.connectToChat(
      user1Id: widget.usersId[0],
      user2Id: widget.usersId[1],
    );
    _fetchChatTitle();
    _controller.addListener(() {
      setState(() {
        _isNotEmpty = _controller.text.trim().isNotEmpty;
      });
    });
  }

  Future<void> _fetchChatTitle() async {
    final otherUserId = widget.usersId.firstWhere((id) => id != currentUserId);
    final title = await ChatHelper().getUserNameById(otherUserId);
    setState(() {
      chatTitle = title;
    });
  }

  @override
  void dispose() {
    chatCubit.disconnectSocket();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: chatTitle),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(child: MessagesListView(usersId: widget.usersId)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: S.of(context).send_mess,
                  suffixIcon: _isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            if (_isNotEmpty) {
                              final messages = chatCubit.messages;
                              String receiverId;
                              if (messages.isNotEmpty) {
                                receiverId = messages.last.senderId ==
                                        currentUserId
                                    ? widget.usersId
                                        .firstWhere((id) => id != currentUserId)
                                    : messages.last.senderId;
                              } else {
                                receiverId = widget.usersId
                                    .firstWhere((id) => id != currentUserId);
                              }
                              chatCubit.sendMessage(
                                receiverId: receiverId,
                                message: _controller.text,
                              );
                              _controller.clear();
                            }
                          },
                          icon: Icon(
                            Icons.send,
                            color: AppColors.primaryColor,
                            size: 30,
                          ),
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
