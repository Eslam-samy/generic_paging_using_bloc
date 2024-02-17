import 'package:generic_paging_using_bloc/di/app_module.dart';
import 'package:generic_paging_using_bloc/paging/data/data_source/remote_data_source.dart';
import 'package:generic_paging_using_bloc/paging/data/repository/paging_list_repository_impl.dart';
import 'package:generic_paging_using_bloc/paging/domain/repository/morty_characters_repository.dart';
import 'package:generic_paging_using_bloc/paging/domain/usecase/get_paging_list_usecase.dart';
import 'package:generic_paging_using_bloc/paging/presentation/bloc/paging_list_bloc.dart';

pagingListModule() {
  // data
  getIt.registerFactory<GetPagingListRemoteDataSource>(
    () => GetPagingListRemoteImpl(),
  );
  getIt.registerFactory<PagingListRepository>(
    () => PagingListRepositoryImpl(getIt(), getIt()),
  );

  // domain
  getIt.registerFactory<GetPagingListUseCase>(
    () => GetPagingListUseCase(getIt()),
  );
  // presentation
  getIt.registerFactory<PagingListBloc>(
    () => PagingListBloc(getIt()),
  );
}
