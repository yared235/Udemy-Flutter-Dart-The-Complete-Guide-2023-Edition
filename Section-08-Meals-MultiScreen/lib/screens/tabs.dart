import 'package:flutter/material.dart';
import 'package:sec8_multiscreen_app/data/dummy_data.dart';
import 'package:sec8_multiscreen_app/models/meal.dart';
import 'package:sec8_multiscreen_app/screens/categories.dart';
import 'package:sec8_multiscreen_app/screens/filter_meals.dart';
import 'package:sec8_multiscreen_app/screens/meals.dart';
import 'package:sec8_multiscreen_app/widgets/drawer.dart';
const kIntialFilters={
    Filter.glutenFree :false,
    Filter.lactoseFree :false,
    Filter.vegiterian :false,
    Filter.vegan :false
  };
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  Map<Filter, bool> selectdFilters =kIntialFilters;
  void messageF(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  int selectedPageIndex = 0;
  final List<Meal> favoriteMeals = [];
  void favIconOnPress(Meal favMeal) {
    bool isExisting;
    isExisting = favoriteMeals.contains(favMeal);
    if (isExisting) {
      setState(() {
        favoriteMeals.remove(favMeal);
        messageF('the meal is no longer faverite');
      });
    } else {
      setState(() {
        favoriteMeals.add(favMeal);
        messageF('the meal is marked as faverite');
      });
    }
  }

  var activePageTitle = 'Catagories';
  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
      activePageTitle = 'Favorites';
    });
  }

  void onScreenSelect(String identifier) async {
    if (identifier == 'Filter') {
      Navigator.pop(context);
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (cxt) => FilterMeals(currentFilters: selectdFilters,),
        ),
      );
      setState(() {
        selectdFilters=result ?? kIntialFilters;
        print(result);
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var availableMeals=dummyMeals.where((meal) {
    if(selectdFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if(selectdFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if(selectdFilters[Filter.vegiterian]! && !meal.isVegetarian) {
      return false;
    }
    if(selectdFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
  print(availableMeals);
    Widget activeScreen = CatagoriesScreen(
      favIconOnPress: favIconOnPress, availableMeals: availableMeals,
    );
    if (selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: favoriteMeals,
        favIconOnPress: favIconOnPress,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onScreenSelect: onScreenSelect,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
      body: activeScreen,
    );
  }
}
