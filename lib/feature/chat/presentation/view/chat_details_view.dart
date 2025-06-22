import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/chat/data/repo/chat_repo_impl.dart';
import 'package:graduation_project/feature/chat/data/repo/chat_service.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/chat_details_view_body.dart';
import '../view_model/cubit/chats_cubit.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({
    super.key,
    required this.landlordId,
  });
  final String landlordId;
  // final String landlordName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChatCubit(
              ChatRepoImpl(),
            ),
        child: ChatDetailsViewBody(
          landlordId: landlordId,
          // landlordName: landlordName,
        ));
  }
}
