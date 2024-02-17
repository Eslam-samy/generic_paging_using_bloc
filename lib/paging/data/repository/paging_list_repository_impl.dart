import 'package:dio/dio.dart';
import 'package:generic_paging_using_bloc/core/network_info/network_info.dart';
import 'package:generic_paging_using_bloc/core/resources/data_state.dart';
import 'package:generic_paging_using_bloc/paging/core/api/api_client.dart';
import 'package:generic_paging_using_bloc/paging/data/data_source/remote_data_source.dart';
import 'package:generic_paging_using_bloc/paging/domain/repository/morty_characters_repository.dart';

class PagingListRepositoryImpl<T> extends PagingListRepository<T> {
  final GetPagingListRemoteDataSource<T>
      getPagingListRemoteDataSource; // Adjust the type parameter here
  final NetworkInfo networkInfo;

  PagingListRepositoryImpl(
    this.getPagingListRemoteDataSource,
    this.networkInfo,
  );

  @override
  Future<DataState<T>> getPagingList(
      int page, int pageSize, String url, String queryParameter) async {
    final dio = PagingApiClient.getInstance(url);

    if (await networkInfo.isConnected) {
      // Adjust the type parameter when calling getPagingListRemoteDataSource.getPagingList
      final result = await getPagingListRemoteDataSource.getPagingList(
          page, pageSize, url, queryParameter, dio);

      // If the result is DataSuccess, return it as-is
      if (result is DataSuccess<T>) {
        return result;
      } else if (result is DataFailed) {
        // If the result is DataFailed, handle the error accordingly
        return DataFailed(result.error!);
      }
    } else {
      return DataFailed(DioException(
        error: 'No internet connection',
        requestOptions: RequestOptions(path: 'your_api_path_here'),
      ));
    }

    // Add a return statement for the case when networkInfo.isConnected is false
    return DataFailed(DioException(
      error: 'No internet connection',
      requestOptions: RequestOptions(path: 'your_api_path_here'),
    ));
  }
}
