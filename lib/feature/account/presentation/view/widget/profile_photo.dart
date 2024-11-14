import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/change_photo_button.dart';

class ProfilePhoto extends StatelessWidget {
  final String image;
  const ProfilePhoto({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: CachedNetworkImageProvider(image),
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
