import 'package:flutter/material.dart';
import '../services/dummy_data.dart';
import 'recipe_detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteRecipes =
        DummyData.recipes.where((recipe) => recipe.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Favorit'),
      ),
      body: favoriteRecipes.isEmpty
          ? const Center(child: Text('Belum ada resep favorit.'))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
                return ListTile(
                  leading: Image.network(
                    recipe.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(recipe.name),
                  subtitle: Text(recipe.category),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(recipe: recipe),
                      ),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                );
              },
            ),
    );
  }
}
