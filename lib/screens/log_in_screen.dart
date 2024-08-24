import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mealeapp/screens/home_screen.dart';
import 'package:mealeapp/screens/register_screen.dart';
import 'package:mealeapp/widgets/constant.dart';
import 'package:mealeapp/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool _isObscure = true;

// sign in with google
  Future signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error Title',
          desc: 'Sign in canceled by user',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to Home Screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      print("Error: $e");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error Title',
        desc: 'Error occurred while signing in with Google',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
    }
  }
// Reset Password

  Future<void> resetPassword(BuildContext context) async {
    if (_emailController.text.isEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error Title',
        desc: 'Please enter your email.',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
      return;
    }
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Success Title',
        desc: 'Password reset email sent.',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Success Title',
        desc: 'Please check the email you entered is correct or not',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 5),
        child: Form(
          key: formKey,
          child: Column(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: (){
                      resetPassword(context);
                    },
                    child:const Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
             const SizedBox(
                height: 40,
              ),
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                obsertex: false,
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
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
              InkWell(
                onTap: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                             isLoading = true;
                            setState(() {});
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                                   
                            if (credential.user!.emailVerified) {
                              //التحقق من التاكيد من البريد الالكتروني اولا  عند تسجيل دخول
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>const HomeScreen()),
                              );
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error Title',
                                desc:
                                    'Please Verify Your Email to Login.............',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            }
                          } on FirebaseAuthException catch (e) {
                            isLoading = false;
                            setState(() {});
                            print("Error Code: ${e.code}");
                            if (e.code == 'user-not-found') {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error Title',
                                desc: 'Email is not correct.............',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            } else if (e.code == 'wrong-password') {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error Title',
                                desc: 'Password is not correct.............',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error Title',
                                desc: 'An error occurred. Please try again.',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            }
                          } catch (e) {
                            print("Error: $e");
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error Title',
                              desc: 'An error occurred. Please try again.',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          }
                        }
                      },
                child: Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: const Center(
                      child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
             const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'or',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                },
                child: Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: const Center(
                      child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
             const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  signInWithGoogle(
                              context,
                            );
                },
                child: Container(
                  width: 320,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/google-logo-with-3d-render-etched-glass-material-soft-glow-multicolor-sche_655090-3367562.jpg',
                          height: 60,
                          width: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Continue with Google',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
