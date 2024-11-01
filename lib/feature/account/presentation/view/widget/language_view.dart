import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/home/presentation/view_model/bloc/language_bloc.dart';
import 'package:graduation_project/generated/l10n.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).language),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<LanguageBloc>(context)
                    .add(ArabicLanguageEvent());
              },
              child: const Text("Arabic")),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<LanguageBloc>(context)
                    .add(EnglishLanguageEvent());
              },
              child: const Text("English")),
        ],
      ),
    );
  }
}
