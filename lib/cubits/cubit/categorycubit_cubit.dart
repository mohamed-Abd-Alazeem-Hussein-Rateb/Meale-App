import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart'as http;
import 'package:mealeapp/models/get_food_modle.dart';
import 'package:meta/meta.dart';

part 'categorycubit_state.dart';

class CategorycubitCubit extends Cubit<CategorycubitState> {
  CategorycubitCubit() : super(CategorycubitInitial());

   List<FoodModle> food = [];
 void getFoddCategory({required String category}) async {
   try {
      emit(GetFoddCategoryLoading());
      http.Response response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'));

      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['meals'] != null) {
         food.clear(); // Reset the list before adding new data
         for (var element in data['meals']) {
            food.add(FoodModle.fromJson(element));
         }
         emit(GetFoddCategorySuccess(food: food));
      } else {
         emit(GetFoddCategoryError(error: 'Something went wrong or meals not found'));
      }
   } catch (e) {
      print('Error: $e');
      emit(GetFoddCategoryError(error: e.toString()));
   }
}
 



   
}
