import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealeapp/widgets/constant.dart';
import 'package:mealeapp/widgets/custom_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _nameController.text = user.displayName ?? 'No Name'; // اسم المستخدم من الـ Firebase
      _emailController.text = user.email ?? 'No Email'; // البريد الإلكتروني من الـ Firebase
      // هنا يمكن تخزين كلمة المرور في المتغير إذا كانت متوفرة
      _passwordController.text = '********'; // هنا يمكن وضع كلمة مرور وهمية أو مشفرة
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: KprimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            CustomTextField(
              controller: _nameController,
              labelText: 'Name',
              obsertex: false,
              prefixIcon: const Icon(Icons.person, color: Colors.black),
              enabled: false, // تعطيل التعديل على الحقول
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _emailController,
              labelText: 'Email',
              obsertex: false,
              prefixIcon: const Icon(Icons.email, color: Colors.black),
              enabled: false, // تعطيل التعديل على الحقول
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Password',
              obsertex: _isObscure,
              prefixIcon: const Icon(Icons.lock, color: Colors.black),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure; // تغيير الحالة بين إظهار وإخفاء كلمة المرور
                  });
                },
                child: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off, // تغيير الأيقونة حسب الحالة
                  color: Colors.black,
                ),
              ),
              enabled: false, // تعطيل التعديل على الحقول
            ),
          ],
        ),
      ),
    );
  }
}
