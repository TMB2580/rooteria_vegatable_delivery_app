import 'package:flutter/material.dart';
import 'package:myapp/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

@override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Delivery in progress.."),
          backgroundColor: Colors.transparent, // Assuming you want a transparent background
        ), // AppBar
        bottomNavigationBar: _buildBottomNavBar(context),
        body: const Column(
          children: [
            MyReceipt(), // Assuming MyReceipt is a defined widget
          ], // Column
        ), // Scaffold
      );
    }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container( // outer container for bottom nav
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary, // Or any color you prefer
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ), // BorderRadius.only
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // profile pic of driver
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person),
                ),
              ),
              // driver details - driver name
              Text(
                "Driver Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              //message container
              IconButton(
                  onPressed: () {
                    // Add the action here when the icon is pressed.
                  },
                  icon: const Icon(Icons.message)
                  ),
              //call container
              IconButton(
                  onPressed: () {
                    // Add the action here when the icon is pressed.
                  },
                  icon: const Icon(Icons.call)
                  ),

            ], // Row
          ),
        ),
      ); // Container
  }
}