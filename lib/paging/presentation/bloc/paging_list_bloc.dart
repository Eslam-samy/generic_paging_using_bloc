import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:generic_paging_using_bloc/core/resources/data_state.dart';
import 'package:generic_paging_using_bloc/paging/domain/usecase/get_paging_list_usecase.dart';
import 'package:generic_paging_using_bloc/paging/presentation/contract/paging_list_ui_state.dart';

part 'paging_list_event.dart';
part 'paging_list_state.dart';

class PagingListBloc<T> extends Bloc<PagingListEvent, PagingListState> {
  GetPagingListUseCase getPagingListUseCase;
  // final T Function(dynamic data) mapper;
  
    PagingListBloc(this.getPagingListUseCase)
      : super(PagingListState(uiModel: PagingListUiState(isLoading: true))) {
    on<LoadDataEvent>((event, emit) async {
      emit(
        PagingListState(
          uiModel: state.uiModel!.copyWith(
            url: event.url,
            queryParameter: event.queryParameter,
          ),
        ),
      );
      final dataState = await getPagingListUseCase(
          state.uiModel!.currentPage!, 10, event.url, event.queryParameter);
      if (dataState is DataSuccess && dataState.data != null) {
        emit(
          PagingListState(
            uiModel: state.uiModel!.copyWith(
              isLoading: false,
              items: dataState.data!.results!
                  .map(
                    (e) => e.toUiModel(),
                  )
                  .toList(),
            ),
          ),
        );
      }
      if (dataState is DataFailed) {
        emit(
          PagingListState(
              uiModel: state.uiModel!
                  .copyWith(isLoading: false, error: dataState.error)),
        );
      }
    });

    on<LoadNextPageEvent>((event, emit) {});
  }
}
