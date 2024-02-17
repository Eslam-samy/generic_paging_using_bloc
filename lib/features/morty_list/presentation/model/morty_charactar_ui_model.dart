import 'package:generic_paging_using_bloc/paging/base/presentation/base_presentation_model.dart';

class MortyCharacterUiModel extends BaseUiModel {
  final int? id;
  final String? name;

  MortyCharacterUiModel({
    this.id,
    this.name,
  });
}
