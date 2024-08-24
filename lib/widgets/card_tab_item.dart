import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealeapp/cubits/cubit/get_fodd_category_cubit.dart';
import 'package:mealeapp/widgets/constant.dart';

class CardTabItem extends StatelessWidget {
  const CardTabItem({
    super.key,
    required this.food,
  });

  final dynamic food; // او ممكن تبقا كده  final dynamic food;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFoddCategoryCubit, GetFoddCategoryState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26, // لون الظل
                        blurRadius: 16.0, // شدة الظل
                        offset: Offset(0, 4), // اتجاه الظل
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(120)),
                    child: Image.network(
                      food.image ?? '',
                      fit: BoxFit.cover,
                      width: 140, // عرض الصورة لملء الحاوية
                      height: 140,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          food.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: KprimaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite,
                                  color: Colors.grey[400], size: 25),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart,
                                    color: Colors.grey[400], size: 25)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
