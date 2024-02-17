import 'package:flutter/material.dart';

class PagingListWidget<T> extends StatelessWidget {
  const PagingListWidget({
    Key? key,
    required this.data,
    required this.listItemBuilder,
    this.loaderWidget,
  }) : super(key: key);

  final List<T> data;
  final Widget Function(int index) listItemBuilder;
  final Widget? loaderWidget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == data.length) {
          // Reached the end of the list, show loader.
          return loaderWidget ??
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
        } else {
          return listItemBuilder(index);
        }
      },
      itemCount: data.length + 1,
    );
  }
}
