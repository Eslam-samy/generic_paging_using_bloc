part of 'paging_list_bloc.dart';

sealed class PagingListEvent extends Equatable {
  const PagingListEvent();

  @override
  List<Object> get props => [];
}

class LoadDataEvent extends PagingListEvent {
  final String url;
  final String queryParameter;

  const LoadDataEvent({required this.url, required this.queryParameter});

   @override
  List<Object> get props => [];
}

class LoadNextPageEvent extends PagingListEvent {}
