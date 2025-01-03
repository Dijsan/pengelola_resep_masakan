import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/recipe.dart';
import '../services/dummy_data.dart';
import 'recipe_detail_screen.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User currentUser;
  List<Recipe> displayedRecipes = [];
  String selectedCategory = 'Semua'; 
  final TextEditingController _searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentUser = ModalRoute.of(context)?.settings.arguments as User;
    displayedRecipes = DummyData.recipes;
  }

  void _searchRecipes(String query) {
    setState(() {
      displayedRecipes = DummyData.recipes.where((recipe) {
        final nameMatch = recipe.name.toLowerCase().contains(query.toLowerCase());
        final ingredientMatch = recipe.ingredients.any(
            (ingredient) => ingredient.name.toLowerCase().contains(query.toLowerCase())
        );
        return nameMatch || ingredientMatch;
      }).toList();
    });
  }

  void _filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'Semua') {
        displayedRecipes = DummyData.recipes;
      } else {
        displayedRecipes = DummyData.recipes
            .where((recipe) => recipe.category == category)
            .toList();
      }
    });
  }

  void _goToFavorites() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavoriteScreen()),
    ).then((value) {
      // refresh state jika perlu
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['Semua', 'Makanan Penutup', 'Makanan Sehat'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Masakan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: _goToFavorites,
          ),
        ],
      ),
      body: Column(
        children: [
          // TextField pencarian
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _searchRecipes,
              decoration: const InputDecoration(
                labelText: 'Cari Resep / Bahan',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Dropdown untuk kategori
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: selectedCategory,
              items: categories
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  _filterByCategory(value);
                }
              },
            ),
          ),
          // Daftar resep
          Expanded(
            child: ListView.builder(
              itemCount: displayedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = displayedRecipes[index];
                return ListTile(
                  leading: Image.network(
                    recipe.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(recipe.name),
                  subtitle: Text(recipe.category),
                  trailing: IconButton(
                    icon: Icon(
                      recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: recipe.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        recipe.isFavorite = !recipe.isFavorite;
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(recipe: recipe),
                      ),
                    ).then((value) {
                      // Refresh tampilan setelah kembali
                      setState(() {});
                    });
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
