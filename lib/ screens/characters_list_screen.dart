import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/characters_provider.dart';
import 'character_details_screen.dart';

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({super.key});

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharactersProvider>().getCharacters(isRefresh: true);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        context.read<CharactersProvider>().getCharacters();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rick and Morty")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    context.read<CharactersProvider>().search("");
                  },
                ),
              ),
              onSubmitted: (value) {
                context.read<CharactersProvider>().search(value);
              },
            ),
          ),

          Expanded(
            child: Consumer<CharactersProvider>(
              builder: (context, provider, child) {
                if (provider.characters.isEmpty && provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.characters.isEmpty) {
                  return const Center(child: Text("No characters found."));
                }

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: provider.characters.length + (provider.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == provider.characters.length) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final character = provider.characters[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: Hero(
                          tag: character.id,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(character.image),
                          ),
                        ),
                        title: Text(character.name),
                        subtitle: Text(character.species),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CharacterDetailsScreen(character: character),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}