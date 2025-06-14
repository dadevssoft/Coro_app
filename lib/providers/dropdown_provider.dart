  import 'package:flutter/widgets.dart';

  class DropdownProvider extends ChangeNotifier{
    int? _age;
    int? _selectedGrupoCoro;
    String? _selectedVoice;
    String? _selectedGrupoJovenes;
    String? _selectedGenero;
    final List<String> _genero         = ['Hombre', 'Mujer'];
    final List<String> _grupoJovenes   = ['1er Jovenes', '2do Jovenes', '3ro Jovenes', '4to Jovenes', '5to Jovenes'];
    final List<String> _vozJovenes     = ['Bajo', 'Tenor'];
    final List<String> _vozSenoritas   = ['Soprano', 'Alto'];
    final List<String> _grupoSenoritas = ['1er Señoritas', '2do Señoritas', '3ro Señoritas', '4to Señoritas', '5to Señoritas'];

    // List<String> get voz => _voz;
    List<String> get genero => _genero;


    int? get selectedGrupoCoro => _selectedGrupoCoro;
    set selectedGrupoCoro(int? value){
      _selectedGrupoCoro = value;
      notifyListeners();
    }

    int? get age => _age;
    set age(int? value){
      _age =  value;
      notifyListeners();
    }


  String? get selectedGenero => _selectedGenero;
  set selectedGenero(String? value){
      _selectedGenero = value;
      _selectedGrupoJovenes = null;
      _selectedVoice = null;
      notifyListeners();
 }

  List<String> get grupoJovenes {
    return _selectedGenero == 'Hombre' ? _grupoJovenes : _grupoSenoritas;
  }

  List<String> get tipoDeVoz {
    return _selectedGenero == 'Hombre' ? _vozJovenes : _vozSenoritas;
  }


  String? get selectedGrupoJovenes => _selectedGrupoJovenes;
  set selectedGrupoJovenes(String? value){
      _selectedGrupoJovenes = value;
      notifyListeners();
  }


  String? get selectedVoice => _selectedVoice;
  set selectedVoice(String? value){
    _selectedVoice = value;
    notifyListeners();
  }


}