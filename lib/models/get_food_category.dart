class CategoryFoodModel {
  final String id;
  final String name;
  final String image;
  final String description;
  CategoryFoodModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });
  factory CategoryFoodModel.fromJson(Map<String, dynamic> json) {
    return CategoryFoodModel(
      id: json['idCategory'],
      name: json['strCategory'],
      image: json['strCategoryThumb'],
      description: json['strCategoryDescription'],
    );
  }
}