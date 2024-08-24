import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealeapp/cubits/cubit/categorycubit_cubit.dart';
import 'package:mealeapp/cubits/cubit/get_fodd_category_cubit.dart';
import 'package:mealeapp/screens/home_screen.dart';
import 'package:mealeapp/screens/log_in_screen.dart';
import 'package:mealeapp/screens/register_screen.dart';
import 'firebase_options.dart';
import 'package:mealeapp/widgets/bloc_observer.dart';

// في main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // هذا الودجت هو جذر التطبيق
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetFoddCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => CategorycubitCubit(),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home:(FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? const HomeScreen()
          :const RegisterScreen(),
      ),
    );
  }
}
