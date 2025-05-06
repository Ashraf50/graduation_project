import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/api_keys.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/data/manager/auth_supabase_manager.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/chat/data/models/message_model.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/chat_bubble.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/conversation_app_bar.dart';
import 'package:graduation_project/feature/chat/presentation/view_model/cubit/chat_cubit.dart';
import 'package:provider/provider.dart';

class ConversationViewBody extends StatefulWidget {
  const ConversationViewBody({super.key});

  @override
  State<ConversationViewBody> createState() => _ConversationViewBodyState();
}

class _ConversationViewBodyState extends State<ConversationViewBody> {
  final messageController = TextEditingController();
  final _controller = ScrollController();
  // bool isConnected = false;
  late ChatCubit chatCubit;
  @override
  void initState() {
    chatCubit = context.read<ChatCubit>();
    
    super.initState();
  }

  List<MessageModel> messages = [];
  // await ChatRepoImpl(ApiHelper()).sendMessage(
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return CustomScaffold(
      appBar: const ConversationAppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CustomTextfield(
          enableColor: themeProvider.isDarkTheme
              ? AppColors.widgetColorDark
              : Color(0xffBCB8B1),
          hintText: 'Send Message',
          controller: TextEditingController(),
          suffixIcon: IconButton(
            onPressed: () {
              messageController.clear();

              chatCubit.sendMessage(
                receiverId: ApiKeys.id2,
                message: 'new message 10',
              );
              // messages.add(MessageModel(id: id, chatId: chatId, senderId: senderId, message: message, timestamp: timestamp, createdAt: createdAt, updatedAt: updatedAt, v: v))
              chatCubit.getMessages(user1Id: ApiKeys.id1, user2Id: ApiKeys.id2);
              setState(() {});
              // _controller.animateTo(
              //   _controller.position.maxScrollExtent,
              //   duration: Duration(microseconds: 1),
              //   curve: Curves.fastOutSlowIn,
              // );
            },
            icon: Icon(
              Icons.send_rounded,
              size: 35,
              color: Color(0xff55A99D),
            ),
          ),
        ),
      ),
      body: BlocBuilder<ChatCubit, ChatCubitState>(
        builder: (context, state) {
          if (state is GetMessagesSuccess) {
            return ListView.builder(
                reverse: true,
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  List<MessageModel> messages =
                      state.messages.reversed.toList();
                  if (messages[index].senderId ==
                      supabase.auth.currentUser!.id) {
                    return ChatBubble(
                      massage: messages[index].message,
                    );
                  }
                  return ChatBubbleFriend(
                    massage: messages[index].message,
                  );
                });
          } else if (state is GetMessagesFailed) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
