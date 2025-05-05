import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/api_keys.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/chat/data/repo/chat_repo_impl.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/conversation_app_bar.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/conversation_view_body.dart';
import 'package:graduation_project/feature/chat/presentation/view_model/cubit/chat_cubit.dart';
import 'package:provider/provider.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({super.key});

  // final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(ChatRepoImpl(ApiHelper()))
        ..getMessages(
          user1Id: ApiKeys.id1,
          user2Id: ApiKeys.id2,
        ),
      child: ConversationViewBody(),
    );
  }
}
