class LocationDataModel {
  final String? name;
  final String? url;

  LocationDataModel({this.name, this.url});

  factory LocationDataModel.fromJson(Map<String, dynamic> json) {
    return LocationDataModel(
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
