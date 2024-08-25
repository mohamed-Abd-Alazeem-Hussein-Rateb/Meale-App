import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.validator, required this.labelText, this.prefixIcon, this.suffixIcon, this.obsertex =false, this.controller,  this.enabled = true});
final String? Function(String?)? validator;
final String labelText;
final Widget? prefixIcon;
final Widget? suffixIcon;
final bool obsertex;
final bool enabled;
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller:controller ,
      obscureText: obsertex,
      validator:validator,
      decoration:  InputDecoration(
         prefixStyle:const TextStyle(color: Colors.black),
         suffixStyle:const TextStyle(color: Colors.black),
        prefixIcon:prefixIcon ,
        suffixIcon: suffixIcon,
        border:const OutlineInputBorder(
          
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder:const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.black),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        
      ),
    );
  }
}