import 'package:flutter/material.dart';
import 'package:myapp/components/my_current_location.dart';
import 'package:myapp/components/my_description_box.dart';
import 'package:myapp/components/my_drawer.dart';
import 'package:myapp/components/my_food_tile.dart';
import 'package:myapp/components/my_silver_appbar.dart';
import 'package:myapp/components/my_tab_bar.dart';
import 'package:myapp/models/food.dart';
import 'package:myapp/models/restaurant.dart';
import 'package:myapp/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // tab controller
    List<Food> get fullMenu => [];
    List<Food> get fulMenu => [];

    //edges inside for list view
    EdgeInsets get EdgeInside => EdgeInsets.zero;


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fulMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {

      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fulMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInside,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];

          // return food tile UI
          return FoodTile(
            food: food, 
            onTap: () => Navigator.push(context, 
            MaterialPageRoute(
              builder: (context) => FoodPage(food: food,
            ),
          ),
        ),
      );
    },
  );
  }).toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              MySliverAppBar(
                title: MyTabBar(tabController: _tabController),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),

                    // switch

                    // my current location
                    MyCurrentLocation(),

                    // description box
                    const MyDescriptionBox(),
                  ],
                ),
              ),
            ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
