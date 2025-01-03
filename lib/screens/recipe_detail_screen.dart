import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              recipe.imageUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              recipe.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Kategori: ${recipe.category}'),
            const SizedBox(height: 16),
            // Daftar bahan
            const Text(
              'Bahan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...recipe.ingredients.map((ing) {
              return ListTile(
                title: Text('${ing.name} (${ing.quantity} ${ing.unit})'),
              );
            }),
            const SizedBox(height: 16),
            // Langkah-langkah
            const Text(
              'Langkah:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...recipe.steps.map((step) {
              return ListTile(
                title: Text(step),
              );
            }),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
