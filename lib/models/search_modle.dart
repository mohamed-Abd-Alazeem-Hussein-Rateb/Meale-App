class SearchFoodModle {
  final String name;
  final String image;
  final String descrption;
  final String country;

  SearchFoodModle({
    required this.name,
    required this.image,
    required this.descrption,
    required this.country,
  });

  factory SearchFoodModle.fromJson(Map<String, dynamic> json) {
    return SearchFoodModle(
      name: json['strMeal'] ?? 'Unknown Name', // تحقق من وجود الاسم
      image: json['strMealThumb'] ?? '', // تحقق من وجود الصورة
      descrption: json['strInstructions'] ?? 'No description available', // تحقق من وجود الوصف
      country: json['strArea'] ?? 'Unknown Area', // تحقق من وجود الدولة
    );
  }
}
