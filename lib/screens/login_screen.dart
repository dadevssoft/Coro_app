
import 'package:corohp_app/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corohp_app/providers/login_form_provider.dart';
import 'package:corohp_app/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  validator: loginForm.validatorEmail,
                  ),
                SizedBox(height: 20),
                CustomInputsField(
                  icon: Icon(Icons.password_outlined), 
                  labeltext:  'Contraseña', 
                  obscureText: true,
                  onChanged: (value) => loginForm.password = value,
                  validator: loginForm.validatorContrasena,
                  ),
                 SizedBox(height: 40),
               ElevatedButton(onPressed: () async{
                  if(loginForm.isValidForm()){
                    final email    = loginForm.email;
                    final password = loginForm.password;
                    final authProvider = Provider.of<AuthProviderD>(context, listen: false);
                    final errorMessage = await authProvider.login(email, password);
                    if(!context.mounted) return; //Solucion al problema de los context
                    if (errorMessage == null){
                        Navigator.pushNamed(context, 'home_screen');
                    }else{
                        showDialog( // Este da un mensaje de error cuando no haya registrado su gmail
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                               title: Text('Error de inicio de sesión'),
                               content: Text(errorMessage),
                               actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(dialogContext),
                                        child: Text('OK'))]));
                    }
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Por favor complete correctamente el formulario'),
                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 2)));
                  }
                }, 
                child: Text('Iniciar sesión')),
                SizedBox(height: 40,),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, 'register_screen');
                }, child: Text('¿No tienes una cuenta?'))

              ],
            ),
          ),
        ),
      ),
    );
  }
}


