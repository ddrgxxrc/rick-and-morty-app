import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import ' screens/characters_list_screen.dart';
import 'providers/characters_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersProvider()),
      ],
      child: MaterialApp(
        title: 'Rick and Morty',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CharactersListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

