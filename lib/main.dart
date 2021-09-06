import 'package:flutter/material.dart';
import 'routes/router.dart' as router;
import 'routes/routeNames.dart';
import 'pages/login.dart';
import 'pages/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: 'login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue,
        primaryColor: Colors.blue,
        fontFamily: 'Georgia',
        // brightness: Brightness.dark,
      ),

    );
  }
}
