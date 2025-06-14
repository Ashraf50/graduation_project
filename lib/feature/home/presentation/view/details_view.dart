import 'package:flutter/material.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.flat});
  final Flat flat;
  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(
      flat: flat,
    );
  }
}
