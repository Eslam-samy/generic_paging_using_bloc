import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_paging_using_bloc/di/app_module.dart';
import 'package:generic_paging_using_bloc/paging/presentation/bloc/paging_list_bloc.dart';
import 'package:generic_paging_using_bloc/paging/presentation/paging_list_widget.dart';

class PagingListScreen<T> extends StatelessWidget {
  const PagingListScreen(
      {super.key,
      this.queryParameter,
      required this.url,
      required this.listItemBuilder,
      this.mainLoader,
      this.mainErrorWidget});
  final String? queryParameter;
  final String url;
  final Widget Function(T model) listItemBuilder;
  final Widget? mainLoader;
  final Widget? mainErrorWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PagingListBloc>(
      create: (context) => getIt()
        ..add(LoadDataEvent(
          queryParameter: queryParameter ?? "page",
          url: url,
        )),
      child: BlocBuilder<PagingListBloc, PagingListState>(
        builder: (context, state) {
          if (state.uiModel?.isLoading == true) {
            return mainLoader ??
                Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
          }
          if (state.uiModel?.error != null) {
            return mainErrorWidget ??
                Text("Error is  ${state.uiModel?.error?.message}");
          }
          return PagingListWidget(
            data: state.uiModel!.items,
            listItemBuilder: (index) =>
                listItemBuilder(state.uiModel!.items[index]),
            loaderWidget: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
