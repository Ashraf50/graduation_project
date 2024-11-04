import 'package:flutter/material.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/change_photo_button.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/img/test.jpg"),
          ),
          Positioned(
            bottom: -3,
            right: 11,
            child: ChangePhotoButton(
              choosePhoto: () {},
              takePhoto: () {},
            ),
          )
        ],
      ),
    );
  }
}
