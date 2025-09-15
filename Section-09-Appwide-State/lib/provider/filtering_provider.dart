import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meals_provider.dart';
import 'package:meals/screens/filters.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });
  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> choosenFilers) {
    state = choosenFilers;
  }
}

var selctedFilters0 = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
    (ref) => FiltersNotifier());
var filteredMealsProvider = Provider((ref) {
  var selctedFilters = ref.watch(selctedFilters0);
  final meals = ref.watch(mealsProvider);
  var filteredMeals = meals.where((meal) {
    if (selctedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selctedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selctedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (selctedFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
  return filteredMeals;
});
