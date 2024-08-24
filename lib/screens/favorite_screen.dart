import 'package:flutter/material.dart';
import 'package:mealeapp/widgets/constant.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Card(
          color: Color.fromARGB(255, 247, 246, 246),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع العناصر بشكل متساوي
              children: [
                // الصورة
                ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Image.network(
                    'https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg',
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover, // تغيير fit لتجنب تمدد الصورة
                  ),
                ),
                const SizedBox(width: 80), // المسافة بين الصورة والنص
                // النص
               const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Meals',
                        style: TextStyle(
                          color: KprimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '10 Items',
                        style: TextStyle(
                          color: KprimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // أيقونة الحذف
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: KprimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
)
    );
  }
}