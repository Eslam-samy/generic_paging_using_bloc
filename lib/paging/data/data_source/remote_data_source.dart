import 'package:dio/dio.dart';
import 'package:generic_paging_using_bloc/core/resources/data_state.dart';

abstract class GetPagingListRemoteDataSource<T> {
  Future<DataState<T>> getPagingList(
      int page, int pageSize, String url, String queryparameter, Dio dio);
}

class GetPagingListRemoteImpl<T> implements GetPagingListRemoteDataSource<T> {
  @override
  Future<DataState<T>> getPagingList(int page, int pageSize, String url,
      String queryParameter, Dio dio) async {
    try {
      final response =
          await dio.get(url, queryParameters: {queryParameter: page});

      if (response.statusCode == 200) {
        final data = response.data;
        return DataSuccess(data);
      } else {
        // Throw DioError for non-200 status codes
        throw DioException(
          response: response,
          error: 'Failed to load data',
          requestOptions: RequestOptions(path: url),
        );
      }
    } on DioException catch (dioError) {
      // Throw DioError for Dio-specific errors
      return DataFailed(dioError);
    } catch (error) {
      // Throw DioError for generic errors
      return DataFailed(
        DioException(
          error: 'Failed to connect to the server',
          requestOptions: RequestOptions(path: url),
        ),
      );
    }
  }
}
