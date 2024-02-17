import 'package:flutter/material.dart';
import 'package:generic_paging_using_bloc/di/app_module.dart';
import 'package:generic_paging_using_bloc/features/morty_list/presentation/screen/morty_charactars_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIT();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MortyCharactarsScreen(),
    );
  }
}
