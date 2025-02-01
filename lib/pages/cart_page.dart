import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/models/restaurant.dart';
import 'package:myapp/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // cart
        final userCart = restaurant.cart;

        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Cart"),
            actions: [
              // clear cart button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context, builder:
                        (context) => AlertDialog(
                          title: Text(
                            "Are you sure you want to clear the cart?",
                          ),
                          actions: [
                            // cancle button
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),

                            // yes button
                            TextButton(
                              onPressed: () {
                                // clear cart
                                Navigator.pop(context);
                                restaurant.clearCart();
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        ),
                  );
                },
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            ],
          ),
          body: Column(
            children: [

              // list of cart  
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty 
                    ? const Expanded(
                        child: Center(
                          child: const Text("Cart is empty..."),
                          ),
                        )
                    : Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          // get individual cart item
                          final cartItem = userCart[index];
                
                          // ret  urn cart tile UI
                          return ListTile(
                            title: Text(cartItem.name),
                            subtitle: Text('\$${cartItem.price}'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // button to pay
              MyButton(
                text: "Go to Checkout", 
                onTap: () => Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                  ),
                ),
              ),

              const SizedBox(height: 25),

            ],
          ),
        );
      },
    );
  }
}
