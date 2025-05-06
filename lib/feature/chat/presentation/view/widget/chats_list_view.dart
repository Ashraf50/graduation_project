import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/chat_item.dart';
import 'package:graduation_project/feature/chat/presentation/view_model/cubit/chat_cubit.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatCubitState>(
      builder: (context, state) {
        if (state is GetChatsSuccess) {
          return ListView.builder(
            itemCount: state.chats.length,
            itemBuilder: (context, index) {
              return ChatItem(
                chat: state.chats[index],
              );
            },
          );
        } else if (state is GetChatsFailed) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        }
      },
    );
  }
}
