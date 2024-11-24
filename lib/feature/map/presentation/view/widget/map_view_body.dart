import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/map/presentation/view/widget/custom_google_map.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/app_theme.dart';

class MapViewBody extends StatelessWidget {
  const MapViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return CustomScaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: theme.isDarkTheme ? Color(0xff242F3E) : Colors.white,
        title: Text(S.of(context).map),
      ),
      body: CustomGoogleMap(),
    );
  }
}
