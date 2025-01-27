import 'package:flutter/material.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Center(
        child: Text('This is the Services page'),
      ),
    );
  }
}
