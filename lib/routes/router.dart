import 'package:flutter/material.dart';
import 'routeNames.dart';
//import 'package:ellie_fe/route_names.dart';
import 'package:ellie_fe/pages/dashboard.dart';
import 'package:ellie_fe/pages/login.dart';
//import 'package:pms/settings.dart';

Route<dynamic> generateRoute(RouteSettings settings) {

  final args = settings.arguments;

  switch(settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => Dashboard());
    case LoginViewRoute:
      return MaterialPageRoute(builder: (context) => Login());
    case LogoutRoute:
      return MaterialPageRoute(builder: (context) => Login());
    default:
      return MaterialPageRoute(builder: (context) => Dashboard());
  }
}