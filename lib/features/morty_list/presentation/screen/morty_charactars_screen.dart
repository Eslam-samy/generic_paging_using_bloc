import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_paging_using_bloc/core/constants/constants.dart';
import 'package:generic_paging_using_bloc/core/widgets/main_app_loader.dart';
import 'package:generic_paging_using_bloc/di/app_module.dart';
import 'package:generic_paging_using_bloc/features/morty_list/presentation/model/morty_charactar_ui_model.dart';
import 'package:generic_paging_using_bloc/features/morty_list/presentation/widgets/list_item.dart';
import 'package:generic_paging_using_bloc/paging/presentation/bloc/paging_list_bloc.dart';
import 'package:generic_paging_using_bloc/paging/presentation/paging_list_widget.dart';
import 'package:generic_paging_using_bloc/paging/presentation/screen/paging_list_screen.dart';

class MortyCharactarsScreen extends StatelessWidget {
  const MortyCharactarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: PagingListScreen<MortyCharacterUiModel>(
            queryParameter: "page",
            url: "${baseUrl}character",
            listItemBuilder: (model) {
              // Return your list item widget based on the model
              return ListItem(model: model);
            },
            mainLoader: const MainAppLoader(), // Optional
          ),
        ),
      ),
    );
  }
}
