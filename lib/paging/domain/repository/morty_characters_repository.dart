import 'package:generic_paging_using_bloc/core/resources/data_state.dart';

abstract class PagingListRepository<T> {
  Future<DataState<T>> getPagingList(
    int page,
    int pageSize,
    String url,
    String queryParameter
  );
}
