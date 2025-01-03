import '../models/ingredient.dart';
import '../models/recipe.dart';

class DummyData {
  static List<Recipe> recipes = [
    Recipe(
      id: 'r1',
      name: 'Pudding Coklat',
      category: 'Makanan Penutup',
      ingredients: [
        Ingredient(name: 'Coklat bubuk', quantity: 50, unit: 'gram'),
        Ingredient(name: 'Susu cair', quantity: 500, unit: 'ml'),
        Ingredient(name: 'Gula pasir', quantity: 100, unit: 'gram'),
      ],
      steps: [
        'Campur coklat bubuk dan gula pasir di panci.',
        'Tuang susu cair sambil diaduk.',
        'Masak hingga mendidih dan mengental.',
        'Dinginkan dalam cetakan.'
      ],
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/04/30/12/01/chocolate-pudding-6218757_1280.jpg',
    ),
    Recipe(
      id: 'r2',
      name: 'Salad Buah',
      category: 'Makanan Sehat',
      ingredients: [
        Ingredient(name: 'Apel', quantity: 1, unit: 'buah'),
        Ingredient(name: 'Anggur', quantity: 100, unit: 'gram'),
        Ingredient(name: 'Yoghurt', quantity: 200, unit: 'ml'),
      ],
      steps: [
        'Potong buah apel dan anggur.',
        'Campur dengan yoghurt.',
        'Sajikan dingin.'
      ],
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/01/10/04/37/salad-5904093_1280.jpg',
    ),
  ];
}
