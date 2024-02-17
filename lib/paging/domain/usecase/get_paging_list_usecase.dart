import 'package:generic_paging_using_bloc/core/resources/data_state.dart';
import 'package:generic_paging_using_bloc/paging/domain/repository/morty_characters_repository.dart';

class GetPagingListUseCase<T> {
  final PagingListRepository<T> _repository;

  GetPagingListUseCase(this._repository);

  Future<DataState<T>> call(
      int page, int pageSize, String url, String queryParameter) {
    return _repository.getPagingList(page, pageSize, url, queryParameter);
  }
}
