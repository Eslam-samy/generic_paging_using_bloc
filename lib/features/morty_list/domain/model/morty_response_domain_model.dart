import 'package:generic_paging_using_bloc/features/morty_list/domain/model/charactar_domain_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/domain/model/info_domain_model.dart';

class MortyResponseDomainModel {
  final InfoDomainModel? info;
  final List<CharacterDomainModel>? characters;

  MortyResponseDomainModel({this.info, this.characters});
}
