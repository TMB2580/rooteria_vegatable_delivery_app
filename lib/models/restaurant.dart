import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/models/cart_items.dart';

import 'food.dart'; // Import the Food class

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic Cheeseburger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickel.",
      imagePath: "lib/images/burgers/cheese_burger.png",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Extra Bacon", price: 0.75),
        Addon(name: "Extra Lettuce", price: 0.25),
        Addon(name: "Extra Pickles", price: 0.25),
        Addon(name: "Extra Onion", price: 0.25),
        Addon(name: "Double Patty", price: 2.00),
      ],
    ),
    Food(
      name: "Aloha Burger",
      description:
          "A delicious burger with grilled pineapple, juicy beef patty and cheese.",
      imagePath: "lib/images/burgers/aloha_burger.png",
      price: 1.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Extra Bacon", price: 0.75),
        Addon(name: "Extra Pineapple", price: 0.50),
        Addon(name: "Extra Onion", price: 0.25),
        Addon(name: "Double Patty", price: 2.00),
      ],
    ),
    Food(
      name: "BBQ Burger",
      description:
          "A juicy burger with BBQ sauce, beef patty, onion rings and cheese.",
      imagePath: "lib/images/burgers/bbq_burger.png",
      price: 2.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Extra Onion Rings", price: 0.75),
        Addon(name: "Extra BBQ Sauce", price: 0.25),
        Addon(name: "Extra Onion", price: 0.25),
        Addon(name: "Double Patty", price: 2.00),
      ],
    ),
    Food(
      name: "Blue Moon Burger",
      description:
          "A tasty burger with blue cheese, beef patty, onions and pickles.",
      imagePath: "lib/images/burgers/bluemoon_burger.png",
      price: 2.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Blue Cheese", price: 0.75),
        Addon(name: "Extra Pickles", price: 0.25),
        Addon(name: "Extra Onion", price: 0.25),
        Addon(name: "Extra Onions", price: 0.25),
        Addon(name: "Double Patty", price: 2.00),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A juicy burger with vegetables, lettuce, tomatoes and onions.",
      imagePath: "lib/images/burgers/vege_burger.png",
      price: 3.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Lettuce", price: 0.25),
        Addon(name: "Extra Tomato", price: 0.25),
        Addon(name: "Extra Onion", price: 0.25),
        Addon(name: "Extra cheese", price: 10),
      ],
    ),

    // desserts
    Food(
      name: "Cold Coffee Dessert",
      description: "A delicious Cold coffee dessert with ice cream.",
      imagePath: "lib/images/desserts/cold_coffee_desert.png",
      price: 1.99,
      category: FoodCategory.desserts,
      availableAddons: [Addon(name: "Extra ice cream", price: 1.00)],
    ),
    Food(
      name: "Crust Dessert",
      description: "A delicious crust dessert with chocolate.",
      imagePath: "lib/images/desserts/crust_desert.png",
      price: 2.49,
      category: FoodCategory.desserts,
      availableAddons: [Addon(name: "Extra Chocolate", price: 0.75)],
    ),
    Food(
      name: "Cupcake Dessert",
      description: "A delicious cupcake with cream and chocolate.",
      imagePath: "lib/images/desserts/cupecake_desert.png",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [Addon(name: "Extra Cream", price: 0.50)],
    ),
    Food(
      name: "Pan Cake Dessert",
      description: "A delicious Pan cake with chocolate.",
      imagePath: "lib/images/desserts/pan_cake_desert.png",
      price: 3.49,
      category: FoodCategory.desserts,
      availableAddons: [Addon(name: "Extra Chocolate", price: 0.75)],
    ),
    Food(
      name: "Waffles Dessert",
      description: "A delicious Waffles with ice cream.",
      imagePath: "lib/images/desserts/waffels_desert.png",
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [Addon(name: "Extra ice cream", price: 1.00)],
    ),

    // drinks
    Food(
      name: "Coke",
      description: "A coke drink with ice.",
      imagePath: "lib/images/drinks/coke.drink.png",
      price: 1.49,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "Extra Ice", price: 0.25)],
    ),
    Food(
      name: "Fruit Drink",
      description: "A mix of fruit juices.",
      imagePath: "lib/images/drinks/fruit_drink.png",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "Extra Juice", price: 0.50)],
    ),
    Food(
      name: "Lemon Drink",
      description: "A refreshing lemon drink.",
      imagePath: "lib/images/drinks/lemon_drink.png",
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "Extra Lemon", price: 0.25)],
    ),
    Food(
      name: "Wine Drink",
      description: "A glass of red wine.",
      imagePath: "lib/images/drinks/wine_dring.png",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "Extra Wine", price: 0.50)],
    ),

    // salads
    Food(
      name: "Asian Sesame Salad",
      description: "A salad with asian sesame.",
      imagePath: "lib/images/salads/asiansesame_salad.png",
      price: 3.99,
      category: FoodCategory.salads,
      availableAddons: [],
    ),

    Food(
      name: "Caesar Salad",
      description: "A caesar salad with croutons.",
      imagePath: "lib/images/salads/caesar_salad.png",
      price: 3.99,
      category: FoodCategory.salads,
      availableAddons: [],
    ),
    Food(
      name: "Greek Salad",
      description: "A salad with feta cheese.",
      imagePath: "lib/images/salads/greek_salad.png",
      price: 4.49,
      category: FoodCategory.salads,
      availableAddons: [],
    ),
    Food(
      name: "Quinoa Salad",
      description: "A salad with quinoa.",
      imagePath: "lib/images/salads/quinoa_salad.png",
      price: 4.99,
      category: FoodCategory.salads,
      availableAddons: [],
    ),
    Food(
      name: "Southwest Salad",
      description: "A salad with southwest flavors.",
      imagePath: "lib/images/salads/southwest_salad.png",
      price: 5.49,
      category: FoodCategory.salads,
      availableAddons: [],
    ),

    // sides
    Food(
      name: "Garlic Bread",
      description: "A side dish with garlic bread.",
      imagePath: "lib/images/sides/garlic_bread_side.png",
      price: 2.49,
      category: FoodCategory.sides,
      availableAddons: [Addon(name: "Extra Garlic", price: 0.50)],
    ),
    Food(
      name: "Loaded Fries",
      description: "A side dish with loaded fries.",
      imagePath: "lib/images/sides/loadedfries_side.png",
      price: 3.49,
      category: FoodCategory.sides,
      availableAddons: [Addon(name: "Extra Cheese", price: 0.75)],
    ),
    Food(
      name: "Mac & Cheese",
      description: "A side dish with mac & cheese.",
      imagePath: "lib/images/sides/mac_side.png",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [Addon(name: "Extra Cheese", price: 0.75)],
    ),
    Food(
      name: "Onion Rings",
      description: "A side dish with onion rings.",
      imagePath: "lib/images/sides/onion_rings_side.png",
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [Addon(name: "Extra Onion", price: 0.25)],
    ),
  ];

  /* 

  G E T T E R S

  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /* 

  O P E R A T I O N S

  */
  //user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food, food, List<Addon> selectedAddons) {
    //see if there is a cart item already with same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food item are same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameFood && isSameAddons;
    });

    // if item exits increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise, add new cart item to cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // remove form cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // Get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
  /* 

  H E L P E R S

  */

  // generate a receipy

  // format double value into money

  // format list of addons into a string summary
}
