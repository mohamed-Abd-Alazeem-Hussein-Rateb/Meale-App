import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mealeapp/screens/log_in_screen.dart';
import 'package:mealeapp/screens/searchScreen.dart';
import 'package:mealeapp/widgets/constant.dart';
import 'package:mealeapp/widgets/container_image.dart';
import 'package:mealeapp/widgets/mealslist%20.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
        child: Column(
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
              const  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('welcome to meale',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: KprimaryColor
                    ),
                    ),
                    Text('where you can find delicious food',style: TextStyle(fontSize: 17,color: Colors.black),),
                  ],
                ),
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
                }, 
                icon:const Icon(Icons.search,
                color: KprimaryColor,
                ),
                ),
                SizedBox(width: 2,),
                IconButton(onPressed: ()async {
                try {
                GoogleSignIn googleSignIn = GoogleSignIn();
                await googleSignIn.signOut();
              } catch (e) {
                print('Error signing out from Google: $e');
              }

              await FirebaseAuth.instance.signOut();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>const LoginScreen()),
              );
            
                }, icon:const Icon(Icons.logout_outlined,color: KprimaryColor,))
                ],
               )
               ],
               
             ),
            const SizedBox(height: 11),
           const ContainerImage(),
            const SizedBox(height: 11),
          const  Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelColor:KprimaryColor,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        Tab(text: 'Seafood'),
                        Tab(text: 'Vegetarian'),
                        Tab(text: 'Dessert'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          MealsList(category: 'Seafood'),
                          MealsList(category: 'Vegetarian'),
                          MealsList(category: 'Dessert'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
