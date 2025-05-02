import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/feature/chat/data/repo/chat_repo_impl.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/chat_view_body.dart';
import 'package:graduation_project/feature/chat/presentation/view_model/cubit/chat_cubit.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatCubit(ChatRepoImpl(ApiHelper()))..getChats(userId: ''),
      child: const ChatViewBody(),
    );
  }
}
