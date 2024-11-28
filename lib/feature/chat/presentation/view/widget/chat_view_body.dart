import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/core/widget/search_textfield.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/chats_list_view.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).chat),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(
              hintText: S.of(context).search_here,
              controller: TextEditingController(),
              cursorColor: themeProvider.isDarkTheme
                  ? AppColors.white
                  : AppColors.primaryColor,
              focusedColor: AppColors.primaryColor,
              enabledColor: themeProvider.isDarkTheme
                  ? AppColors.widgetColorDark
                  : Color(0xffBCB8B1),
              suffixIcon: Icon(
                Icons.person_search,
                size: 30,
                color: Color(0xff55A99D),
              ),
              radius: 30,
            ),
          
            SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).all_chats,
              style: AppStyles.textStyle24blackBold,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: const ChatsListView()),
          ],
        ),
      ),
    );
  }
}
