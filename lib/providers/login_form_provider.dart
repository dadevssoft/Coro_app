import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{
  GlobalKey<FormState> mykey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  


  bool isValidForm(){

    print(mykey.currentState?.validate());

    return mykey.currentState?.validate() ?? false;
  }


}