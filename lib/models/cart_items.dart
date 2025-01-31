import 'package:myapp/models/food.dart';

class CartItems {
  Food food;
  List<Addon> selecteAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice =
        selecteAddons.fold(0, (aum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}
