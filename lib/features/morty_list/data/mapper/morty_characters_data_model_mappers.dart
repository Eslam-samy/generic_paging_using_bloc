import 'package:generic_paging_using_bloc/features/morty_list/data/model/character_data_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/data/model/info_data_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/data/model/location_data_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/data/model/morty_response_data_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/data/model/origin_data_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/domain/model/charactar_domain_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/domain/model/info_domain_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/domain/model/location_domain_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/domain/model/morty_response_domain_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/domain/model/origin_domain_model.dart';

extension MortycharsDataModelMapper on MortyResponseDataModel {
  MortyResponseDomainModel toDomainModel() {
    return MortyResponseDomainModel(
        info: info?.toDomainModel(),
        characters: results?.map((e) => e.toDomainModel()).toList());
  }
}

extension InfoDataModelMapper on InfoDataModel {
  InfoDomainModel toDomainModel() {
    return InfoDomainModel(count: count, next: next, pages: pages, prev: prev);
  }
}

extension MortyDataModelMapper on CharacterDataModel {
  CharacterDomainModel toDomainModel() {
    return CharacterDomainModel(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        image: image,
        episode: episode,
        url: url,
        created: created,
        location: location!.toDomainModel(),
        origin: origin!.toDomainModel());
  }
}

extension LocationDataModelMapper on LocationDataModel {
  LocationDomainModel toDomainModel() {
    return LocationDomainModel(name: name, url: url);
  }
}

extension OriginDataModelMapper on OriginDataModel {
  OriginDomainModel toDomainModel() {
    return OriginDomainModel(name: name, url: url);
  }
}
