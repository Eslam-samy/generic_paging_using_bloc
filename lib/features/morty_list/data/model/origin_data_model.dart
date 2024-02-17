class OriginDataModel {
  final String? name;
  final String? url;

  OriginDataModel({this.name, this.url});

  factory OriginDataModel.fromJson(Map<String, dynamic> json) {
    return OriginDataModel(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}