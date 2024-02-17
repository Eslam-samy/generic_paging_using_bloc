import 'package:flutter/material.dart';

class ListItem<T> extends StatelessWidget {
  const ListItem({Key? key, required this.model}) : super(key: key);
  final T model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        child: Text(model.toString()),
      ),
    );
  }
}
