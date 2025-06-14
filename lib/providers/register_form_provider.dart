import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier{
GlobalKey<FormState> mykey = GlobalKey<FormState>();

String? _nombre;
String? _email;
String? _password;


set nombre(value){
    _nombre = value;
    notifyListeners();
}
get nombre => _nombre;

set email(value){
    _email = value;
    notifyListeners();
}
get email => _email;

set password(value){
  _password = value;
}
get password => _password;

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

    String? validatorNombre(value){
      if (value == null || value.isEmpty) return 'Este Campo es requerido';
      final trimmedName = value.trim();  // Quita espacios en inicio y fin del string
        if(!RegExp(r'^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ]+(?: [A-Za-zÁÉÍÓÚÜÑáéíóúüñ]+)*$').hasMatch(trimmedName)){
          return 'Nombre no valido';}
        return null;}

    String? validatorContrasena(value) {
      if(value == null ||value.isEmpty) return 'Este campo es requerido';
      final trimmedName = value.trim(); 
        if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{12,}$').hasMatch(trimmedName)){
          return 'Contraseña no valida';}
      return null;}

    String? validatorGenero(value){
      if (value == null || value.isEmpty) return 'Este Campo es requerido';
      return null;
    }

    String? validatorEdad(value){
      if(value == null) return 'Este Campo es requerido';
      return null;
    }
     String? validatorVoz(value){
      if(value == null || value.isEmpty) return 'Este Campo es requerido';
      return null;
    }
     String? validatorGrupoJovenes(value){
      if(value == null || value.isEmpty) return 'Este Campo es requerido';
      return null;
    }
     String? validatorGrupoCoro(value){
      if(value == null) return 'Este Campo es requerido';
      return null;
    }
}