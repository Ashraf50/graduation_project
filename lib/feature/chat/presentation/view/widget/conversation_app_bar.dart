import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_style.dart';

class ConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConversationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/img/test.jpg'),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Ashraf',
            style: AppStyles.textStyle20notBold,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
