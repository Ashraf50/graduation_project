import 'package:flutter/material.dart';
import 'package:graduation_project/feature/material/presentation/views/widgets/materail_view_body.dart';

class MaterailView extends StatelessWidget {
  const MaterailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: MaterailViewBody(),
      )),
    );
  }
}
