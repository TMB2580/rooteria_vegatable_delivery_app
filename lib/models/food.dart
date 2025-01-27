class Food {
  // example
  final String name; // cheese burger
  final String description; // a burger full of cheese
  final String imagePath; // lib/images/cheese_burger.png
  final double price; // burger
  final FoodCategory category; // [ extra cheese, sauce, extra patty ]
  List<Addon>? availableAddon;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    this.availableAddon,
    
  });
}

// food categories

enum FoodCategory { burgers, salads, sides, desserts, drinks }

// food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
