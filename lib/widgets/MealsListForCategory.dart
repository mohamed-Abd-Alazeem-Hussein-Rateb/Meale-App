// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mealeapp/cubits/cubit/get_fodd_category_cubit.dart';
// import 'package:mealeapp/screens/home_screen.dart';

// class MealsListForCategory extends StatelessWidget {
//   final GetFoddCategoryCubit cubit;
//   final String category;

//   const MealsListForCategory({super.key, required this.cubit, required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetFoddCategoryCubit, GetFoddCategoryState>(
//       builder: (context, state) {
//         if (state is GetmealCategoryLoading || state is SearchFoodLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is GetmealCategorySuccess) {
//           final meals = state.meal.where((meal) => meal.name == category).toList();
//           return MealsList(mealList: meals);
//         } else if (state is SearchFoodSuccess) {
//           final meals = state.SearchFood.where((meal) => meal.name == category).toList();
//           return MealsList(mealList: meals);
//         } else if (state is GetmealCategoryError || state is SearchFoodError) {
//           return Center(child: Text('Something went wrong'));
//         }
//         return const Center(child: Text('Something went wrong'));
//       },
//     );
//   }
// }