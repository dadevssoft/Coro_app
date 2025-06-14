import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{
  GlobalKey<FormState> mykey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  


  bool isValidForm(){

    print(mykey.currentState?.validate());

    return mykey.currentState?.validate() ?? false;
  }

    String? validatorEmail(value) {
      if (value == null || value.isEmpty) return 'Este campo es requerido';
      final trimmedEmail = value.trim();
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(trimmedEmail)){
          return 'Correo no valido';}
      return null;}

    String? validatorContrasena(value) {
      if(value == null ||value.isEmpty) return 'Este campo es requerido';
      final trimmedName = value.trim(); 
        if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{12,}$').hasMatch(trimmedName)){
          return 'Contraseña no valida';}
      return null;}
}