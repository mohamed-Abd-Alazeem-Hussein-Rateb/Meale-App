// import 'package:flutter/material.dart';
// import 'package:mealeapp/models/get_food_modle.dart';

// class CardItem extends StatelessWidget {
//   const CardItem({super.key, required this.food});
//   final GetFoodModle food;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.shade300,
//                       spreadRadius: 0,
//                       blurRadius: 5,
//                       offset: const Offset(0, 0), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           food.name!,
//                           maxLines: 1,
//                           style: const TextStyle(
//                               color: Colors.black, fontSize: 17),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               food.relevance.toString(),
//                               style: const TextStyle(
//                                   color: Colors.black, fontSize: 17),
//                             ),
//                             const Icon(
//                               Icons.favorite,
//                               color: Colors.red,
//                               size: 32,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: -85,
//                 left: 55,
//                 child: Image.network(
//                   food.image!,
//                   height: 113,
//                   width: 96,
//                   fit: BoxFit.cover,
//                   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
//                     return Image.network(
//                       'https://img.freepik.com/free-photo/fruit-salad-spilling-floor-was-mess-vibrant-colors-textures-generative-ai_8829-2895.jpg?t=st=1724340260~exp=1724343860~hmac=96d76cbf34dc705632d78fa76b452a35fd2eee126d577989e973f3068f5524ee&w=360',
//                       height: 113,
//                       width: 96,
//                       fit: BoxFit.cover,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
