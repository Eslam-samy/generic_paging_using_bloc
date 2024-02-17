import 'package:flutter/material.dart';

class MainAppLoader extends StatelessWidget {
  const MainAppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
