class RecomendModle {

  final String name;
  final String image;
  final String description;

  RecomendModle({
    required this.name,
    required this.image,
    required this.description,
  });
  factory RecomendModle.fromJson(Map<String, dynamic> json) {
    return RecomendModle(
      name: json['strMeal'],
      image: json['strMealThumb'],
      description: json['idMeal'],
    );
  }
}