import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corohp_app/providers/login_form_provider.dart';
import 'package:corohp_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Scaffold(
      body: Form(
        key:loginForm.mykey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: Column(
              children: [
                SizedBox(height: 130),
                Text('Accede a tu cuenta'),
                SizedBox(height: 20),
                CustomInputsField( 
                  icon: Icon(Icons.email_outlined), 
                  labeltext: 'Correo', 
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => loginForm.email = value,
                  validator: validatorEmail,
                  ),
                SizedBox(height: 20),
                CustomInputsField(
                  icon: Icon(Icons.password_outlined), 
                  labeltext:  'Contraseña', 
                  obscureText: true,
                  onChanged: (value) => loginForm.password = value,
                  validator: validatorContrasena,
                  ),
                SizedBox(height: 40),
                ElevatedButton(onPressed: (){
                  loginForm.isValidForm();
                  Navigator.pushNamed(context, 'home_screen'); //TODO cambiar por replacmennamed
                }, 
                child: Text('Iniciar sesión')),
                SizedBox(height: 40,),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, 'register_screen'); //TODO cambiar por replacmennamed
                }, child: Text('¿No tienes una cuenta?'))

              ],
            ),
          ),
        ),
      ),
    );
  }
    String? validatorContrasena(value) {
                  if(value == null ||value.isEmpty) return 'Este campo es requerido';
                  if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{12,}$').hasMatch(value)){
                    return 'Contraseña no valida';
                  }
                  return null;
                }

  String? validatorEmail(value) {
                  if (value == null || value.isEmpty) return 'Este campo es requerido';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                    return 'Correo no valido';
                  }
                  return null;
                  }

}


