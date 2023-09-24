import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meal';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArg['title'];
    final categoryID = routeArg['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            difficulty: categoryMeals[index].difficulty,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
