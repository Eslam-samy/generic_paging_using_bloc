import 'package:generic_paging_using_bloc/features/morty_list/domain/model/location_domain_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/domain/model/origin_domain_model.dart';

class CharacterDomainModel {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final OriginDomainModel? origin;
  final LocationDomainModel? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  CharacterDomainModel({
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
}
