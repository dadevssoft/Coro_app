import 'package:flutter/material.dart';
import 'package:corohp_app/screens/screens.dart';


class AppRoutes {

  static const initialRoute = 'login_screen';

  static final Map<String, Widget Function(BuildContext)> routes = {
      'login_screen'    : (context) => LoginScreen(),
      'home_screen'     : (context) => HomeScreen(),
      'calendar_screen' : (context) => CalendarScreen(),
      'register_screen' : (context) => RegisterScreen(),

  };
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
        return MaterialPageRoute(builder: (context)=> NotFoundScreen());
      }

}
