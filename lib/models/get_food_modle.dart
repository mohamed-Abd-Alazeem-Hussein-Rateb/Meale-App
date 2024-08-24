 // هذا الاستيراد غير ضروري في هذا السياق ويمكن إزالته

class FoodModle {
 final String image;
 final String name;
 final String id; // استخدم int بدلاً من Int

  FoodModle({
    required this.image,
    required this.name,
    required this.id,

  });

  factory FoodModle.fromJson(Map<String, dynamic> json) {
    return FoodModle(
      image: json['strMealThumb'],
      name: json['strMeal'],
      id: json['idMeal'], // تأكد من أن المفتاح هو 'id'
    );
  }
}
