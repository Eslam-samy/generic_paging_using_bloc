import 'package:generic_paging_using_bloc/features/morty_list/data/model/location_data_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/data/model/origin_data_model.dart';

class CharacterDataModel {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final OriginDataModel? origin;
  final LocationDataModel? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  CharacterDataModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharacterDataModel.fromJson(Map<String, dynamic> json) {
    return CharacterDataModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin'] != null
          ? OriginDataModel.fromJson(json['origin'])
          : null,
      location: json['location'] != null
          ? LocationDataModel.fromJson(json['location'])
          : null,
      image: json['image'],
      episode: (json['episode'] as List?)?.cast<String>(),
      url: json['url'],
      created: json['created'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin?.toJson(),
      'location': location?.toJson(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created,
    };
  }
}
