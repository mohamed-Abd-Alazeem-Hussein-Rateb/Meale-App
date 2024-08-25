import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealeapp/screens/log_in_screen.dart';
import 'package:mealeapp/widgets/constant.dart';
import 'package:mealeapp/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool _isObscure = true;

bool _passwordsMatch() {
    return _passwordController.text == _confirmPasswordController.text;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: 30,),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'sign up',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ]),
                  SizedBox(height: 12,),
                 const Text(
                      'Hello to meale',
                      style: TextStyle(
                          color:KprimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  
              const SizedBox(
                height: 55,
              ),
              
              CustomTextField(
                  controller: _nameController,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  labelText: 'Name',
                  obsertex: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: _emailController,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  labelText: 'Email',
                  obsertex: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                obsertex: _isObscure,
                prefixIcon: const Icon(Icons.lock, color: Colors.black),
                suffixIcon: InkWell(
                    onTap: () {
                    setState(() {
                      _isObscure = !_isObscure; // تغيير الحالة بين إظهار وإخفاء الباسورد
                    });
                  },
                  child: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off, // تغيير الأيقونة حسب الحالة
                    color: Colors.black,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: _confirmPasswordController,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                    setState(() {
                      _isObscure = !_isObscure; // تغيير الحالة بين إظهار وإخفاء الباسورد
                    });
                  },
                  child: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off, // تغيير الأيقونة حسب الحالة
                    color: Colors.black,
                  ),
                ),
                  labelText: 'Confirm Password',
                  obsertex: _isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                      if (formKey.currentState!.validate()) {
                        if (_passwordsMatch()) {
                        try {
                          isLoading = true;
                          setState(() {});
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                              
                          isLoading = false;
                          setState(() {});
                          FirebaseAuth.instance.currentUser!.sendEmailVerification();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginScreen()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'The password provided is too weak.',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          } else if (e.code == 'email-already-in-use') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'The account already exists for that email.',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          }
                        } catch (e) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: e.toString(),
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                        }
                      } else {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'Confirmation password does not match.',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        ).show();
                      }
                    }
                      },
                child: Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    color: KprimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 20, ),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginScreen()));
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: KprimaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
