import 'package:generic_paging_using_bloc/features/morty_list/data/model/character_data_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/data/model/info_data_model.dart';

class MortyResponseDataModel {
  final InfoDataModel? info;
  final List<CharacterDataModel>? results;

  MortyResponseDataModel({this.info, this.results});

  factory MortyResponseDataModel.fromJson(Map<String, dynamic> json) {
    return MortyResponseDataModel(
      info: json['info'] != null ? InfoDataModel.fromJson(json['info']) : null,
      results: (json['results'] as List?)
          ?.map((result) => CharacterDataModel.fromJson(result))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'info': info?.toJson(),
      'results': results?.map((result) => result.toJson()).toList(),
    };
  }
}
