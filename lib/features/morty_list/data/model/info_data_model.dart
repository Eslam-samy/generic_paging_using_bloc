class InfoDataModel {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  InfoDataModel({this.count, this.pages, this.next, this.prev});

  factory InfoDataModel.fromJson(Map<String, dynamic> json) {
    return InfoDataModel(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }
}
