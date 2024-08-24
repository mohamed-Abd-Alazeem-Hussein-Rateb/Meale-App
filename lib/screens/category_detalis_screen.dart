import 'package:flutter/material.dart';
import 'package:mealeapp/models/get_food_category.dart';
import 'package:mealeapp/widgets/constant.dart';

class CategoryDetalisScreen extends StatefulWidget {
  const CategoryDetalisScreen({super.key, required this.meal});
  final CategoryFoodModel meal;
  @override
  State<CategoryDetalisScreen> createState() => _CategoryDetalisScreenState();
}

class _CategoryDetalisScreenState extends State<CategoryDetalisScreen> {
 int _quantity = 1; // حالة الكمية

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: KprimaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة الكتاب
              Image.network(
                widget.meal.image,
                width: double.infinity,
                height: 330,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // اسم الكتاب، المؤلف، ووقت النشر
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.meal.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: KprimaryColor,
                                ),
                              ),
                              const SizedBox(height: 9),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 9),
                    // وصف الكتاب
                    const Text(
                      "DESCRIPTION",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: KprimaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.meal.description,
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // اختيار الكمية والسعر
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "QUANTITY",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: KprimaryColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove,
                                    color: KprimaryColor,
                                    
                                    ),
                                    onPressed: _decreaseQuantity,
                                  ),
                                  Text("$_quantity"),
                                  IconButton(
                                    icon: const Icon(Icons.add,
                                    color: KprimaryColor,
                                    ),
                                    onPressed: _increaseQuantity,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "SUB TOTAL",
                              style: TextStyle(
                                fontSize: 14,
                                color: KprimaryColor,
                                fontWeight: FontWeight.bold,
                                
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "\$${(_quantity * double.parse(widget.meal.id)).toStringAsFixed(2)}", // حساب السعر الإجمالي
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    // زر الإضافة للسلة
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: KprimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "ADD TO BASKET",
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}