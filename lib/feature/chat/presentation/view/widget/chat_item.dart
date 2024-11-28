import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_style.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          context.push('/conversation_view');
        },
        child: const Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/img/test.jpg'),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ashraf Essam',
                  style: AppStyles.textStyle18black,
                ),
                Text('hello')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
