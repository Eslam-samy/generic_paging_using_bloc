import 'package:generic_paging_using_bloc/features/morty_list/domain/model/charactar_domain_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/presentation/model/morty_charactar_ui_model.dart';

extension MortyUiModelMapper on CharacterDomainModel {
  MortyCharacterUiModel toUiModel() {
    return MortyCharacterUiModel(
      id: id,
      name: name,
    );
  }
}
