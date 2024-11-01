import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';

import '../../../../../generated/l10n.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).category),
    );
  }
}
