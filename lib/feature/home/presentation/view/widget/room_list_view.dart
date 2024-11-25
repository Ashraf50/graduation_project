import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/decoration_container.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/post_item.dart';

class RoomsListView extends StatelessWidget {
  const RoomsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return DecorationContainer(
      widget: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const PostItem();
        },
      ),
    );
  }
}
