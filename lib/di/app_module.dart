import 'package:generic_paging_using_bloc/di/singleton_module.dart';
import 'package:generic_paging_using_bloc/paging/di/paging_list_module.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initGetIT() async {
  // TODO why?
  await singletonModule();
  await pagingListModule();
}
