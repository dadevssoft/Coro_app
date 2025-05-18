import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Perfil"),
              CircleAvatar(child: Text("DF")),
              Text("Daniel Flores"),
              Text("Puntos: 12"),
              ElevatedButton(onPressed: () async{
                try{
                  Position posicion = await _determinePosition();
                  print("Latitud: ${posicion.latitude}");
                  print("Longitud: ${posicion.longitude}");
                } catch (e){
                  print("Error al obtener la ubicación $e");
                }
              }, 
              child: Text("Tomar Asistencia"))
            ],
          ),
        ),
      );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Los servicios de ubicación están desactivados.');
  }

  permission = await Geolocator.checkPermission();  //solo pregunta “¿tengo permiso?”
  if (permission == LocationPermission.denied) { //denied denegada
    permission = await Geolocator.requestPermission(); //pide permiso si no tienes
  if (permission == LocationPermission.denied) { //si lo denegan otra vez
      return Future.error('Los permisos de ubicación fueron denegados.');
    }
  }

  if (permission == LocationPermission.deniedForever) { //denegado para siempre
    return Future.error(
      'Los permisos de ubicación fueron denegados permanentemente. No se pueden volver a solicitar.');
  }

  return await Geolocator.getCurrentPosition();
}
