import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/feature/map/presentation/view_model/bloc/map_bloc.dart';
import 'package:graduation_project/feature/map/presentation/view_model/bloc/map_event.dart';
import 'package:graduation_project/generated/l10n.dart';

void showLocationErrorDialog(BuildContext context, String errorMessage,
    MapBloc mapBloc, ThemeProvider theme) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor:
            theme.isDarkTheme ? AppColors.widgetColorDark : AppColors.white,
        title: Text(S.of(context).error),
        content: Text(
          errorMessage,
          style: AppStyles.textStyle18black,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                mapBloc.add(LoadMap());
              },
              child: Text(
                S.of(context).retry,
                style: TextStyle(fontSize: 20),
              )),
        ],
      );
    },
  );
}
