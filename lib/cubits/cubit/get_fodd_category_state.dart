part of 'get_fodd_category_cubit.dart';

@immutable
sealed class GetFoddCategoryState {}

final class GetFoddCategoryInitial extends GetFoddCategoryState {}
final class GetmealCategoryLoading extends GetFoddCategoryState {}

final class GetmealCategorySuccess extends GetFoddCategoryState {
  final List<CategoryFoodModel> meal;
  GetmealCategorySuccess({required this.meal});
}

final class GetmealCategoryError extends GetFoddCategoryState {
  final String error;
  GetmealCategoryError({required this.error});
}



final class SearchFoodLoading extends GetFoddCategoryState {}

final class SearchFoodSuccess extends GetFoddCategoryState {
  final List<SearchFoodModle> SearchFood;
  SearchFoodSuccess({required this.SearchFood});
}

final class SearchFoodError extends GetFoddCategoryState {
  final String error;
  SearchFoodError({required this.error});
}






final class RecommendationFoodLoading extends GetFoddCategoryState {}

final class RecommendationFoodSuccess extends GetFoddCategoryState {
  final List<RecomendModle> RecommendationFood;
  RecommendationFoodSuccess({required this.RecommendationFood});
}

final class RecommendationFoodError extends GetFoddCategoryState {
  final String error;
  RecommendationFoodError({required this.error});
}