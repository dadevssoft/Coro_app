import 'package:corohp_app/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corohp_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:corohp_app/providers/providers.dart';
import 'package:corohp_app/routes/app_routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();    //Inicializamos Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginFormProvider()),
        ChangeNotifierProvider(create: (context) => DropdownProvider()),
        ChangeNotifierProvider(create: (context) => AuthProviderD()),
        ChangeNotifierProvider(create: (context) => RegisterFormProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }

}