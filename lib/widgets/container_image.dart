import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealeapp/cubits/cubit/get_fodd_category_cubit.dart';
import 'package:mealeapp/screens/category_detalis_screen.dart';

class ContainerImage extends StatelessWidget {
  const ContainerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFoddCategoryCubit, GetFoddCategoryState>(
      builder: (context, state) {
        if (state is GetFoddCategoryInitial) {
          context.read<GetFoddCategoryCubit>().getMealeCategory();
        }

        if (state is GetmealCategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetmealCategorySuccess) {
          if (state.meal.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }
          return SizedBox(
            height: 185,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.meal.length,
              itemBuilder: (context, index) {
                var meal = state.meal[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryDetalisScreen(meal: meal),
                        ),
                      );
                    },
                    child: Container(
                  height: 100,
                  width: 175,
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(120),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26, // لون الظل
                        blurRadius: 5.0, // شدة الظل
                        offset: Offset(0, 4), // اتجاه الظل
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(120)),
                    child: Image.network(
                      meal.image ,
                      fit: BoxFit.fill,
                      height: 100,
                      width: 100, // عرض الصورة لملء الحاوية
                    ),
                  ),
                ),
                  ),
                );
              },
            ),
          );
        } else if (state is GetmealCategoryError) {
          return const Center(
            child: Text('No data available'),
          );
        }
        return const Center(child: SizedBox());
      },
    );
  }
}
