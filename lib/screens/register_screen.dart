import 'package:corohp_app/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corohp_app/providers/providers.dart';
import 'package:corohp_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen ({super.key});

  @override
  Widget build(BuildContext context) {    
    final registerForm = Provider.of<RegisterFormProvider>(context);

    return Scaffold(
      body: Form(
        key: registerForm.mykey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text('Crea una cuenta'),
                    SizedBox(height: 20),
                    CustomInputsField( 
                      icon: Icon(Icons.person), 
                      labeltext: 'Nombre Completo', 
                      keyboardType: TextInputType.name,
                      validator: registerForm.validatorNombre,
                      onChanged: (value) => registerForm.nombre = value,
                      ),
                    SizedBox(height: 20),
                    CustomInputsField( 
                      icon: Icon(Icons.email), 
                      labeltext: 'Email', 
                      keyboardType: TextInputType.emailAddress,
                      validator: registerForm.validatorEmail,
                      onChanged: (value) => registerForm.email = value,
                      ),
                      SizedBox(height: 20),
                      CustomInputsField( 
                      icon: Icon(Icons.password), 
                      labeltext: 'Contraseña', 
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: registerForm.validatorContrasena,
                      onChanged: (value) => registerForm.password = value,
                      ),
                    SizedBox(height: 20,),
                    Consumer<DropdownProvider>(
                      builder: (context, dropdownmenu, child) {
                        return CustomDropdownButtonFormField<String>(
                            icon: Icon(Icons.male),
                            labeltext: 'Genero',
                            value: dropdownmenu.selectedGenero,
                            items: dropdownmenu.genero
                            .map((genero) => DropdownMenuItem<String>(value: genero, child: Text(genero)))
                            .toList(),
                          onChanged: (value) => dropdownmenu.selectedGenero = value,
                          validator: registerForm.validatorGenero,
                      );
                },
                          ),
                    SizedBox(height: 20),
                    Consumer<DropdownProvider>(
                    builder: (context, dropdownmenu, child) {
                      return CustomDropdownButtonFormField<int>(
                          icon: Icon(Icons.cake),
                          labeltext: 'Edad',
                          value: dropdownmenu.age,
                          items: List.generate(50, (index) => index + 16)
                            .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                            .toList(),
                          onChanged: (value) => dropdownmenu.age = value,
                          validator: registerForm.validatorEdad,
                      );
                },
                          ),
                    SizedBox(height: 20),
                   Consumer<DropdownProvider>(
                    builder: (context, dropdownmenu, child) {
                      return CustomDropdownButtonFormField<String>(
                          icon: Icon(Icons.mic),
                          labeltext: 'Voz',
                          value: dropdownmenu.selectedVoice,
                          items: dropdownmenu.tipoDeVoz
                          .map((voice) => DropdownMenuItem<String>(value: voice, child: Text(voice)))
                          .toList(),
                        onChanged: (value) => dropdownmenu.selectedVoice = value,
                        validator: registerForm.validatorVoz,
                      );
                },
                          ),
                    SizedBox(height: 20,),
                    Consumer<DropdownProvider>(
                      builder: (context, dropdownmenu, child) {
                        return CustomDropdownButtonFormField<String>(
                            icon: Icon(Icons.group),
                            labeltext: 'Grupo de Jovenes',
                            value: dropdownmenu.selectedGrupoJovenes,
                            items: dropdownmenu.grupoJovenes
                            .map((grupoJovenes) => DropdownMenuItem<String>(value: grupoJovenes, child: Text(grupoJovenes)))
                            .toList(),
                          onChanged: (value) => dropdownmenu.selectedGrupoJovenes = value,
                          validator: registerForm.validatorGrupoJovenes,
                      );
                },
                          ),
                    SizedBox(height: 20),
                    Consumer<DropdownProvider>(
                      builder: (context, dropdownmenu, child) {
                        return CustomDropdownButtonFormField<int>(
                            icon: Icon(Icons.group_add),
                            labeltext: 'Grupo de Coro',
                            value: dropdownmenu.selectedGrupoCoro,
                            items: List.generate(3, (index) => index + 1)
                            .map((grupoCoro) => DropdownMenuItem(value: grupoCoro, child: Text('$grupoCoro')))
                            .toList(),
                          onChanged: (value) => dropdownmenu.selectedGrupoCoro = value,
                          validator: registerForm.validatorGrupoCoro,
                      );
                },
                          ),
                    SizedBox(height: 40),
                    TextButton(
                    onPressed: () async{
                      if(!registerForm.isValidForm()) return;{
                        final dropdownData = Provider.of<DropdownProvider>(context, listen: false); 
                        final authProvider = Provider.of<AuthProviderD>(context, listen: false);
                        final registerData = Provider.of<RegisterFormProvider>(context, listen: false);

                        final Map<String, dynamic> dataToSave = {
                          'nombre'       : registerForm.nombre,
                          'email'        : registerForm.email,
                          'password'     : registerForm.password,
                          'genero'       : dropdownData.selectedGenero,
                          'edad'         : dropdownData.age,
                          'voz'          : dropdownData.selectedVoice,
                          'grupoJovenes' : dropdownData.selectedGrupoJovenes,
                          'grupoCoro'    : dropdownData.selectedGrupoCoro,
                          'fechaRegistro': Timestamp.now(), // útil para saber cuándo se registró

                        };

                        final email = registerData.email?.trim().toLowerCase();
                        final password = registerData.password;
                        final errorMessage = await authProvider.register(email!, password, dataToSave);
                        
                          if (errorMessage != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(errorMessage)),
                            );
                          } else {
                            // Registro exitoso, puedes navegar a otra pantalla
                            Navigator.pushReplacementNamed(context, 'home_screen');
                          }




                        print(dataToSave);

                      }
                    }, 
                    child: Text('Enviar'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}



