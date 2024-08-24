import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealeapp/cubits/cubit/get_fodd_category_cubit.dart';
import 'package:mealeapp/widgets/card_tab_item.dart';
import 'package:mealeapp/widgets/constant.dart';

class RecomndationItem extends StatelessWidget {
  const RecomndationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Adjust alignment
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Recomended',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: KprimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<GetFoddCategoryCubit, GetFoddCategoryState>(
            builder: (context, state) {
              if (state is RecommendationFoodLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is RecommendationFoodSuccess) {
                if (state.RecommendationFood.isEmpty) {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
                return SizedBox(
                  height: 200, // Adjust height according to your requirement
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: state.RecommendationFood.length,
                    itemBuilder: (context, index) {
                      var recomend= state.RecommendationFood[index];
                      return CardTabItem(food: recomend);
                    },
                  ),
                );
              } else if (state is RecommendationFoodError) {
                return Center(child: Text(state.error));
              }
              return const Center(child: Text('Something went wrong'));
            },
          ),
        ],
      ),
    );
  }
}
