import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class PagingListUiState<T> extends Equatable {
  final bool? isLoading;
  final bool? isLoadingMore;
  final int? currentPage;
  final DioException? error;
  final List<T> items; // Change to use generic type T for items
  final String? url;
  final String? queryParameter;

  PagingListUiState({
    this.isLoading,
    this.isLoadingMore,
    this.error,
    List<T>? items, // Change to use generic type T for items
    int? currentPage,
    this.url,
    this.queryParameter,
  })  : items = items ?? List.empty(growable: true),
        currentPage = currentPage ?? 1;

  @override
  List<Object?> get props => [
        isLoading,
        isLoadingMore,
        error,
        items,
        url,
        queryParameter,
      ];

  PagingListUiState<T> copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    DioException? error,
    List<T>? items,
    String? url,
    String? queryParameter,
  }) {
    return PagingListUiState<T>(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error ?? this.error,
      items: items ?? this.items,
      url: url ?? this.url,
      queryParameter: queryParameter ?? this.queryParameter,
    );
  }
}
