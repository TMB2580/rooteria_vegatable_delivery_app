import 'package:flutter/material.dart';
import 'package:myapp/models/food.dart';
import 'package:collection/collection.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key, 
    required this.food,
  }){
     // initialize selected addons to be false, if availableAddons is not null
     if(food.availableAddons != null){
       for (String addon in food.availableAddons!) {
         selectedAddons[Addon(name: addon, price: 0)] = false;
       }
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // scaffold UI
      Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // food image
              Image.asset(widget.food.imagePath),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // food name
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    // food price
                    Text(
                      '\$${widget.food.price}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // food description
                    Text(widget.food.description),

                     const SizedBox(height: 10),
                     Divider(
                        color: Theme.of(context).colorScheme.secondary,
                     ),

                    //Addons
                    Text(
                      "Add-ons",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                     Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: widget.food.availableAddon == null
                          ? Container()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: widget.food.availableAddon.length ?? 0,
                              itemBuilder: (context, index) {
                                // get individual addon for food
                                String addonString =
                                    widget.food.availableAddon[index] ?? '';
                                final addon = Addon(name: addonString, price: 0);

                                // return check box UI
                                return CheckboxListTile(
                                  title: Text(addon.name),
                                  subtitle: Text(
                                    '\$${addon.price}',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  value: widget.selectedAddons.containsKey(addon) ? widget.selectedAddons[addon] : false,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if(value != null){
                                         widget.selectedAddons[addon] = value;
                                      }
                                    });
                                  },
                                );
                              },
                              ),
                      ),







                  ],
                ),
              ),

               // button -> add to cart
                const SizedBox(height: 25),
            ],
          ),
        ),
      ),
         
          

          
          // back button
        Container(
            decoration: 
              BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              
                
              ),
           
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
        
    ],
    );
  }
}

