import 'package:flutter/material.dart';

class CustomInputsField extends StatelessWidget {

  final Icon icon;
  final String labeltext;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomInputsField({
    super.key, 
    this.keyboardType,
    this.obscureText = false, 
    this.validator,
    this.onChanged, 
    required this.icon, 
    required this.labeltext, 
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: icon,
        labelText: labeltext,
      ),
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
