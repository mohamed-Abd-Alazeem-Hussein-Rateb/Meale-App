import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealeapp/cubits/cubit/categorycubit_cubit.dart';
import 'package:mealeapp/widgets/card_tab_item.dart';

class MealsList extends StatefulWidget {
  final String category;

  const MealsList({super.key, required this.category});

  @override
  _MealsListState createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  late CategorycubitCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<CategorycubitCubit>();
    _cubit.getFoddCategory(category: widget.category);
  }

  @override
  void didUpdateWidget(covariant MealsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      _cubit.getFoddCategory(category: widget.category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorycubitCubit, CategorycubitState>(
      builder: (context, state) {
        if (state is CategorycubitInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetFoddCategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetFoddCategorySuccess) {
          if (state.food.isEmpty) {
            return const Center(child: Text('No data available'));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: state.food.length,
            itemBuilder: (context, index) {
              var meal = state.food[index];
              return CardTabItem(food: meal);
            },
          );
        } else if (state is GetFoddCategoryError) {
          return Center(child: Text(state.error));
        }
        return const Center(child: Text('Something went wrong'));
      },
    );
  }
}
