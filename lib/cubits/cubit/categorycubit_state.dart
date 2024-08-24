part of 'categorycubit_cubit.dart';

@immutable
sealed class CategorycubitState {}

final class CategorycubitInitial extends CategorycubitState {}
final class GetFoddCategoryLoading extends CategorycubitState {}

final class GetFoddCategorySuccess extends CategorycubitState {
  final List<FoodModle> food;
  GetFoddCategorySuccess({required this.food});
}

final class GetFoddCategoryError extends CategorycubitState {
  final String error;
  GetFoddCategoryError({required this.error});
}

final class homedatafilterSuccessState extends CategorycubitState {}
