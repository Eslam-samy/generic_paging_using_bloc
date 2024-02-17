part of 'paging_list_bloc.dart';

class PagingListState extends Equatable {
  final PagingListUiState? uiModel;
  const PagingListState({this.uiModel});
  @override
  List<Object> get props => [uiModel ?? ""];
}
