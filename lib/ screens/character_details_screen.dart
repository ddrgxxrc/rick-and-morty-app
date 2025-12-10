import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: character.id,
              child: Image.network(
                character.image,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) => const Icon(Icons.error, size: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildInfoRow("Name", character.name),
                      const Divider(),
                      _buildInfoRow("Status", character.status),
                      const Divider(),
                      _buildInfoRow("Species", character.species),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
