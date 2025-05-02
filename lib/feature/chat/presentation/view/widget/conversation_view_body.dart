import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/chat_bubble.dart';
import 'package:graduation_project/feature/chat/presentation/view_model/cubit/chat_cubit.dart';

class ConversationViewBody extends StatelessWidget {
  const ConversationViewBody({super.key});

  // await ChatRepoImpl(ApiHelper()).sendMessage(
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatCubitState>(
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
    );
  }
}
