class GenericUiModel<T> {
  final Map<String, dynamic> data;

  GenericUiModel({required this.data});

  T mapToModel(ApiResponseMapper<T> mapper) {
    return mapper.map(data);
  }
}

abstract class ApiResponseMapper<T> {
  T map(Map<String, dynamic> jsonData);
}