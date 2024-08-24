import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mealeapp/models/get_food_category.dart';
import 'package:mealeapp/models/recomend_modle.dart';
import 'package:mealeapp/models/search_modle.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'get_fodd_category_state.dart';

class GetFoddCategoryCubit extends Cubit<GetFoddCategoryState> {
  GetFoddCategoryCubit() : super(GetFoddCategoryInitial());

  List<CategoryFoodModel> mealecategory = [];
  List<SearchFoodModle> foodSearch = [];

  // حالة عرض الفئات
  getMealeCategory() async {
    try {
      emit(GetmealCategoryLoading());
      http.Response response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['categories'] != null) {
        mealecategory.clear();
        for (var element in data['categories']) {
          mealecategory.add(CategoryFoodModel.fromJson(element));
        }
        emit(GetmealCategorySuccess(meal: mealecategory));
      } else {
        emit(GetmealCategoryError(error: 'Something went wrong or meals not found'));
      }
    } catch (e) {
      print('Error: $e');
      emit(GetmealCategoryError(error: e.toString()));
    }
  }



  // حالة البحث
searchFood(String query) async {
  try {
    emit(SearchFoodLoading());
    http.Response response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?a=$query'));
    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200 && responseData['meals'] != null) {
      foodSearch.clear();
      for (var element in responseData['meals']) {
        foodSearch.add(SearchFoodModle.fromJson(element));
      }
      emit(SearchFoodSuccess(SearchFood: foodSearch));
    } else {
      emit(SearchFoodError(error: 'No results found for the query'));
    }
  } catch (e) {
    print('Error: $e');
    emit(SearchFoodError(error: 'An error occurred: ${e.toString()}'));
  }
}

  void clearSearch() {
    emit(GetmealCategorySuccess(meal: mealecategory));
  }




  //حاله ال recomendation
  List<RecomendModle> recomend = [];
   RecommendationFood() async {
    try {
  emit(RecommendationFoodLoading());
  http.Response response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken_breast'));
  var data = jsonDecode(response.body);
  if (response.statusCode == 200 && data['meals'] != null) {
    for (var element in data['meals']) {
      recomend.add(RecomendModle.fromJson(element));
    }
    emit(RecommendationFoodSuccess(RecommendationFood: recomend));
  } else {
    emit(RecommendationFoodError(error: 'Something went wrong or foods not found'));
  }
}  catch (e) {
  print('Error: $e');
  emit(RecommendationFoodError(error: 'An error occurred: ${e.toString()}'));
}
}

}