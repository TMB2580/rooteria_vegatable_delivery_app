import 'package:flutter/material.dart';
import 'package:myapp/components/my_quantity_selector.dart';
import 'package:myapp/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/cart_items.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:
          (context, restaurent, child) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cartItem.food.imagePath,
                          height: 100,
                          width: 100,
                        ),
                      ),

                      const SizedBox(width: 10),

                      // name and price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // food name
                          Text(cartItem.food.name),

                          // food price
                          Text('\$${cartItem.food.price}'),
                        ],
                      ),

                      const Spacer(),

                      // increment and decrement quantity
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onDecrement: () {
                          restaurent.removeFromCart(cartItem);
                        },
                        onIncrement: () {
                          restaurent.addToCart(
                            cartItem.food,
                            cartItem.selectedAddons,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // addons
                SizedBox(
                  height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        cartItem.selectedAddons.map((addon) {
                          return FilterChip(
                            label: Row(
                              children: [
                                Text(addon.name),
                                Text(addon.price.toString()),
                              ],
                            ),
                            onSelected: (value) {
                              // Handle chip selection here
                            },
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
