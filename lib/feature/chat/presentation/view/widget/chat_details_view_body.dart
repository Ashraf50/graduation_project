import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/feature/chat/data/model/message.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/function/get_landlord_by_its_id.dart';
import '../../../../../core/widget/custom_app_bar.dart';
import '../../../../../core/widget/custom_scaffold.dart';
import '../../../../../core/widget/custom_toast.dart';
import '../../view_model/cubit/chats_cubit.dart';
import '../../view_model/cubit/chats_state.dart';
import 'chat_bubble.dart';

class ChatDetailsViewBody extends StatefulWidget {
  final String landlordId;
  // final String landlordName;
  const ChatDetailsViewBody({
    super.key,
    required this.landlordId,
    // required this.landlordName,
  });

  @override
  State<ChatDetailsViewBody> createState() => _ChatDetailsViewBodyState();
}

class _ChatDetailsViewBodyState extends State<ChatDetailsViewBody> {
  final TextEditingController _controller = TextEditingController();
  bool _isNotEmpty = false;
  late ChatCubit chatCubit;
  final currentUserId = Supabase.instance.client.auth.currentUser!.id;
  String chatTitle = '...';
  late ScrollController _scrollController;
  String message = '';

  List<MessageModel> messages = [];
  @override
  void initState() {
    log('all messages are : $messages');
    super.initState();
    chatCubit = context.read<ChatCubit>();
    Future.sync(
      () => chatCubit.fetchMessages(
          user1Id: currentUserId, user2Id: widget.landlordId),
    ).then((value) {
      messages = chatCubit.messages;
      log('all messages are : $messages');

      setState(() {});
    });
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _fetchChatTitle();
    _controller.addListener(() {
      setState(() {
        _isNotEmpty = _controller.text.trim().isNotEmpty;
      });
    });
  }

  void _onScroll() {
    if (_isBottom) {
      chatCubit.loadMoreMessages(currentUserId, widget.landlordId);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.95);
  }

  Future<void> _fetchChatTitle() async {
    final title = await getLandLordNameById(widget.landlordId);
    setState(() {
      chatTitle = title;
    });
  }

  @override
  void dispose() {
    // chatCubit.disconnectSocket();
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
          Expanded(
            child: messages.isNotEmpty
                ? AllMessagesList(
                    thiscontext: context,
                    messages: messages,
                    scrollController: _scrollController)
                : BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) {
                      if (state is MessageLoading || state is SendingLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is MessageLoaded) {
                        return AllMessagesList(
                            thiscontext: context,
                            messages: state.messages,
                            scrollController: _scrollController);
                      } else if (state is MessageError) {
                        return Center(
                          child: Text(state.errMessage),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
          ),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 7, left: 7, right: 7, bottom: 15),
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
                          onPressed: () async {
                            await sendMessage(message);
                          },
                          icon: Icon(
                            Icons.send,
                            color: AppColors.primaryColor,
                            size: 30,
                          ),
                        )
                      : null,
                ),
                onChanged: (text) {
                  setState(() {
                    message = text;
                    _isNotEmpty = text.trim().isNotEmpty;
                  });
                },
                onSubmitted: (text) async {
                  await sendMessage(text);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendMessage(String text) async {
    if (_isNotEmpty) {
      await chatCubit.sendMessage(
        receiverId: widget.landlordId,
        message: text,
      );
      await chatCubit.fetchMessages(
        user1Id: currentUserId,
        user2Id: widget.landlordId,
      );
      messages.add(
        MessageModel(
          id: DateTime.now().toString(),
          senderId: currentUserId,
          // receiverId: widget.userId,
          message: text,
          timestamp: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      setState(() {});

      _controller.clear();
    }
  }
}

void _showMessageOptions(
    BuildContext thiscontext, String messageId, String text) {
  showModalBottomSheet(
    context: thiscontext,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.copy),
              title: Text(S.of(thiscontext).copy_mess),
              onTap: () {
                Clipboard.setData(ClipboardData(text: text));
                thiscontext.pop(thiscontext);
                CustomToast.show(message: S.of(thiscontext).mess_copied);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: Text(S.of(context).delete_mess),
              onTap: () {
                thiscontext
                    .read<ChatCubit>()
                    .removeMessage(messageId: messageId);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

class AllMessagesList extends StatelessWidget {
  const AllMessagesList(
      {super.key,
      required this.messages,
      required this.scrollController,
      required this.thiscontext});
  final List<MessageModel> messages;
  final ScrollController scrollController;

  final BuildContext thiscontext;
  @override
  Widget build(BuildContext context) {
    final String currentUserId = Supabase.instance.client.auth.currentUser!.id;

    return ListView.builder(
        // dragStartBehavior: DragStartBehavior.start,
        controller: scrollController,
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];

          final isMe = message.senderId == currentUserId;
          return InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onLongPress: () {
              _showMessageOptions(thiscontext, message.id!, message.message!);
            },
            child: isMe
                ? ChatBubble(massage: message)
                : ChatBubbleFriend(massage: message),
          );
        });
  }
}
