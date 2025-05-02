import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
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
  bool isConnected = false;
  late ChatCubit chatCubit;
  @override
  void initState() {
    chatCubit = context.read<ChatCubit>();
    chatCubit.connectToChat(
      user1Id: '67a2aa1d025d33644c5bc5c6',
      user2Id: '67a34e98d73da2744ebdbc17',
    );
    super.initState();
  }

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
              // chatCubit.sendMessage(
              //   receiverId: '67a34e98d73da2744ebdbc17',
              //   // message: _controller.text,
              //   message: 'new message',
              // );

              messageController.clear();

              chatCubit.sendMessage(
                receiverId: '67a34e98d73da2744ebdbc17',
                // message: _controller.text,
                message: 'new message',
              );
              // _controller.animateTo(
              //   _controller.position.maxScrollExtent,
              //   duration: Duration(microseconds: 1),
              //   curve: Curves.fastOutSlowIn,
              // );
            },
            icon: isConnected
                ? Icon(
                    Icons.send_rounded,
                    size: 35,
                    color: Color(0xff55A99D),
                  )
                : SizedBox(),
          ),
        ),
      ),
      body: BlocBuilder<ChatCubit, ChatCubitState>(
        builder: (context, state) {
          if (state is GetMessagesSuccess) {
            return ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    massage: state.messages[index].message,
                  );
                });
          } else if (state is GetMessagesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetMessagesFailed) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: Text('No Messages'),
            );
          }
        },
      ),
    );
  }
}
