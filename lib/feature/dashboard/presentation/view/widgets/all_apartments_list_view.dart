import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/decoration_container.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/apartment_item.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';

class AllApartmentsListView extends StatelessWidget {
  const AllApartmentsListView({super.key, required this.flats});
  final List<Flat> flats;
  @override
  Widget build(BuildContext context) {
    return DecorationContainer(
      widget: ListView.builder(
        itemCount: flats.length,
        itemBuilder: (context, index) {
          return ApartmentItem(
            flat: flats[index],
          );
        },
      ),
    );
  }
}
