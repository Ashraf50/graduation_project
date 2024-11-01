import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/generated/l10n.dart';

import '../../../../../core/widget/custom_app_bar.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).favorite),
    );
  }
}
