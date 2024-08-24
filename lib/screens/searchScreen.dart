import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealeapp/cubits/cubit/get_fodd_category_cubit.dart';
import 'package:mealeapp/screens/searh_screen_detalies.dart';
import 'package:mealeapp/widgets/card_tab_item.dart';
import 'package:mealeapp/widgets/constant.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetFoddCategoryCubit>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 37, 10, 0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                   cubit.clearSearch();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined,color: KprimaryColor,),
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  cubit.searchFood(value); // استدعاء دالة البحث
                } else {
                  cubit.clearSearch(); // مسح النتائج عند خلو النص
                }
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            
            const SizedBox(height: 20,),
            BlocBuilder<GetFoddCategoryCubit, GetFoddCategoryState>(
              builder: (context, state) {
                if (state is SearchFoodLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchFoodSuccess) {
                
                   return Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: state.SearchFood.length,
          itemBuilder: (context, index) {
            var search = state.SearchFood[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearhScreenDetalies(searchfood: search),
                  ),
                );
              },
              child: CardTabItem(food: search),
            );
          },
        ),
      );
                } else if (state is SearchFoodError) {
                  return Center(child: Text(state.error)); // عرض رسالة الخطأ
                }
                return const Center(child: Text('Start searching to see results.',style: TextStyle(fontSize: 18,color: KprimaryColor),));
              },
            ),
          ],
        ),
      ),
    );
  }
}
