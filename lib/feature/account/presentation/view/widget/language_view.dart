import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/account/presentation/view_model/bloc/language_bloc.dart';
import 'package:graduation_project/generated/l10n.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  String? _selectedLanguage; // Store the selected language

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).language),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              S.of(context).arabic,
              style: AppStyles.textStyle18black,
            ),
            leading: Radio<String>(
              value: 'Arabic',
              groupValue: _selectedLanguage,
              onChanged: (String? value) {
                setState(() {
                  _selectedLanguage = value;
                });
                BlocProvider.of<LanguageBloc>(context)
                    .add(ArabicLanguageEvent());
              },
            ),
          ),
          ListTile(
            title:
                Text(S.of(context).english, style: AppStyles.textStyle18black),
            leading: Radio<String>(
              value: 'English',
              groupValue: _selectedLanguage,
              onChanged: (String? value) {
                setState(() {
                  _selectedLanguage = value;
                });
                BlocProvider.of<LanguageBloc>(context)
                    .add(EnglishLanguageEvent());
              },
            ),
          ),
        ],
      ),
    );
  }
}
