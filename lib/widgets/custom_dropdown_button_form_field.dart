import 'package:flutter/material.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {

  final Icon icon;
  final String labeltext;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  
  const CustomDropdownButtonFormField({
    super.key, 
    required this.icon, 
    required this.labeltext, 
    required this.value, 
    required this.items, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: labeltext,
        border: OutlineInputBorder()),
      value: value, 
      items: items,
      onChanged: onChanged
    );
  }
}
