import 'package:flutter/material.dart';
import 'package:mealeapp/models/search_modle.dart';
import 'package:mealeapp/widgets/constant.dart';

class SearhScreenDetalies extends StatefulWidget {
  const SearhScreenDetalies({super.key, required this.searchfood});
 final SearchFoodModle searchfood;
  @override
  State<SearhScreenDetalies> createState() => _SearhScreenDetaliesState();
}

class _SearhScreenDetaliesState extends State<SearhScreenDetalies> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة الكتاب
              Image.network(
                widget.searchfood.image,
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
                                widget.searchfood.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: KprimaryColor,
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 12),
                    // وصف الكتاب
                    const Text(
                      "DESCRIPTION",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: KprimaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.searchfood.descrption,
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
                                    icon: const Icon(Icons.remove, color: KprimaryColor),
                                    onPressed: _decreaseQuantity,
                                  ),
                                  Text("$_quantity"),
                                  IconButton(
                                    icon: const Icon(Icons.add, color: KprimaryColor),
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
                              "Country",
                              style: TextStyle(
                                fontSize: 18,
                                color: KprimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.searchfood.country, // حساب السعر الإجمالي
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 43),
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









// class SearhScreenDetalies extends StatefulWidget {
//   const SearhScreenDetalies({super.key, required this.searchfood});
//   final SearchFoodModle searchfood;
//   @override
//   State<SearhScreenDetalies> createState() => _CategoryDetalisScreenState();
// }

// class _CategoryDetalisScreenState extends State<SearhScreenDetalies> {
//  int _quantity = 1; // حالة الكمية

//   void _increaseQuantity() {
//     setState(() {
//       _quantity++;
//     });
//   }

//   void _decreaseQuantity() {
//     setState(() {
//       if (_quantity > 1) {
//         _quantity--;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // صورة الكتاب
//             Image.network(
//               widget.searchfood.image,
//               width: double.infinity,
//               height: 330,
//               fit: BoxFit.fill,
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // اسم الكتاب، المؤلف، ووقت النشر
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.searchfood.name,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
                  
//                   const SizedBox(height: 12),
//                   // وصف الكتاب
//                   const Text(
//                     "DESCRIPTION",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     widget.searchfood.descrption,
//                     maxLines: 7,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // اختيار الكمية والسعر
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           const Text(
//                             "QUANTITY",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 65, 230, 255),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Container(
//                             height: 50,
//                             width: 160,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(19),
//                               border: Border.all(color: Colors.grey[300]!),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.remove),
//                                   onPressed: _decreaseQuantity,
//                                 ),
//                                 Text("$_quantity"),
//                                 IconButton(
//                                   icon: const Icon(Icons.add),
//                                   onPressed: _increaseQuantity,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           const Text(
//                             "SUB TOTAL",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             widget.searchfood.country, // حساب السعر الإجمالي
//                             style: const TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 65, 230, 255),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 22),
//                   // زر الإضافة للسلة
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 65, 230, 255),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         "ADD TO BASKET",
//                         style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }