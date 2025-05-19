import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corohp_app/providers/providers.dart';
import 'package:corohp_app/routes/app_routes.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginFormProvider()),
        ChangeNotifierProvider(create: (context) => DropdownProvider()),
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