import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/home/presentation/view_model/bloc/language_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant/app_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomScaffold(
      body: ListView(
        children: [
          Text(
            "data",
            style: TextStyle(
                color: themeProvider.isDarkTheme ? Colors.red : Colors.black),
          ),
        ],
      ),
    );
  }
}
