import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corohp_app/providers/providers.dart';
import 'package:corohp_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen ({super.key});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: Column(
              children: [
                SizedBox(height: 130),
                Text('Crea una cuenta'),
                SizedBox(height: 20),
                CustomInputsField( 
                  icon: Icon(Icons.person), 
                  labeltext: 'Nombre Completo', 
                  keyboardType: TextInputType.emailAddress,
                  ),
                SizedBox(height: 20),
                CustomInputsField( 
                  icon: Icon(Icons.email), 
                  labeltext: 'Email', 
                  keyboardType: TextInputType.emailAddress,
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
                      items: List.generate(50, (index) => index + 1)
                        .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                        .toList(),
                      onChanged: (value) => dropdownmenu.age = value,
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
                      items: dropdownmenu.voz
                      .map((voice) => DropdownMenuItem<String>(value: voice, child: Text(voice)))
                      .toList(),
                    onChanged: (value) => dropdownmenu.selectedVoice = value,
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
                  );
  },
),
                SizedBox(height: 40,)
              ],
            ),
          ),
        ),
      ),
    );
  }

}



