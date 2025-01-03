import 'ingredient.dart';

class Recipe {
  final String id;
  final String name;
  final String category; // Contoh: "Makanan Penutup", "Makanan Sehat", dll.
  final List<Ingredient> ingredients;
  final List<String> steps; // Langkah-langkah memasak
  final String imageUrl;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.ingredients,
    required this.steps,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
