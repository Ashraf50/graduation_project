import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/decoration_container.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/apartment_item.dart';

class AllApartmentsListView extends StatelessWidget {
  const AllApartmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecorationContainer(
      widget: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const ApartmentItem();
        },
      ),
    );
  }
}
