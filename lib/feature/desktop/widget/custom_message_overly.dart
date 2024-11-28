import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/feature/chat/presentation/view/widget/chats_list_view.dart';
import 'package:provider/provider.dart';
import '../../../core/widget/search_textfield.dart';
import '../../../generated/l10n.dart';

class CustomMessageOverlay extends StatelessWidget {
  final VoidCallback onClose;
  const CustomMessageOverlay({
    super.key,
    required this.onClose,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        GestureDetector(
          onTap: onClose,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            width: screenWidth,
            height: screenHeight,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: screenWidth * .3,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: theme.isDarkTheme
                      ? AppColors.scaffoldColorDark
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchTextField(
                        hintText: S.of(context).search_here,
                        controller: TextEditingController(),
                        cursorColor: theme.isDarkTheme
                            ? AppColors.white
                            : AppColors.primaryColor,
                        focusedColor: AppColors.primaryColor,
                        enabledColor: theme.isDarkTheme
                            ? AppColors.widgetColorDark
                            : Color(0xffBCB8B1),
                        suffixIcon: Icon(
                          Icons.person_search,
                          size: 30,
                          color: Color(0xff55A99D),
                        ),
                        radius: 30,
                      ),
                      SizedBox(height: 5),
                      Text(
                        S.of(context).all_chats,
                        style: AppStyles.textStyle24blackBold,
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ChatsListView(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
