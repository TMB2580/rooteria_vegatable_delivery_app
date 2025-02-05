import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/models/cart_items.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    
    // Vegetables
    Food(
      name: "Broccoli",
      description: "Fresh, green broccoli florets.",
      imagePath: "lib/images/vegetables/broccoli.png", // Assuming you add broccoli image
      price: 2.50,
      category: FoodCategory.vegetables,
      availableAddons: [],
    ),
    Food(
      name: "Spinach",
      description: "Nutrient-rich spinach leaves.",
      imagePath: "lib/images/vegetables/spinach.png", // Assuming you add spinach image
      price: 1.99,
      category: FoodCategory.vegetables,
      availableAddons: [],
    ),
    Food(
      name: "Carrots",
      description: "Crunchy, sweet carrots.",
      imagePath: "lib/images/vegetables/carrots.png", // Assuming you add carrots image
      price: 1.50,
      category: FoodCategory.vegetables,
      availableAddons: [],
    ),
    Food(
      name: "Tomatoes",
      description: "Ripe, juicy tomatoes.",
      imagePath: "lib/images/vegetables/tomatoes.png", // Assuming you add tomatoes image
      price: 2.00,
      category: FoodCategory.vegetables,
      availableAddons: [],
    ),


    // Fruits
    Food(
      name: "Bananas",
      description: "Sweet and creamy bananas.",
      imagePath: "lib/images/fruits/bananas.png", // Assuming you add bananas image
      price: 0.99,
      category: FoodCategory.fruits,
      availableAddons: [],
    ),
    Food(
      name: "Apples",
      description: "Crisp and refreshing apples.",
      imagePath: "lib/images/fruits/apples.png", // Assuming you add apples image
      price: 1.20,
      category: FoodCategory.fruits,
      availableAddons: [],
    ),
    Food(
      name: "Strawberries",
      description: "Juicy, sweet strawberries.",
      imagePath: "lib/images/fruits/strawberries.png", // Assuming you add strawberries image
      price: 3.50,
      category: FoodCategory.fruits,
      availableAddons: [],
    ),
    Food(
      name: "Oranges",
      description: "Zesty and refreshing oranges.",
      imagePath: "lib/images/fruits/oranges.png", // Assuming you add oranges image
      price: 1.75,
      category: FoodCategory.fruits,
      availableAddons: [],
    ),
    Food(
      name: "Avocado",
      description: "Creamy, buttery avocado.",
      imagePath: "lib/images/fruits/avocado.png", // Assuming you add avocado image
      price: 4.00,
      category: FoodCategory.fruits,
      availableAddons: [],
    ),
    Food(
      name: "Blueberries",
      description: "Sweet and Antioxidant-packed blueberries.",
      imagePath: "lib/images/fruits/blueberries.png", // Assuming you add blueberries image
      price: 4.50,
      category: FoodCategory.fruits,
      availableAddons: [],
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
  void addToCart(Food food, List<Addon> selectedAddons) {
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

  // generate a recipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");

    receipt.writeln();

    // Format the date to include up to seconds only
    String formattedDate = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.now());
    receipt.writeln("Date: $formattedDate"); // Add date to receipt

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-------------");

    // Iterate through addons and add to receipt
    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food} - ${_formatPrice(cartItem.food.price)}",
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
          "    Add-ons: ${_formatAddons(cartItem.selectedAddons)}",
        );
      }
      receipt.writeln();
    }

    receipt.writeln("----------------");
    receipt.writeln();
    receipt.writeln("Total Item: ${_formatPrice(getTotalPrice())}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // Format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // Format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
