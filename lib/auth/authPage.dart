import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ellie_fe/routes/routeNames.dart';
import 'package:ellie_fe/pages/login.dart';
import 'package:ellie_fe/pages/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoggedIn=false;
  @override
  void initState() {
    // TODO: implement initState
    _checkLoginStatus();
    super.initState();
  }
  _checkLoginStatus() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token!= null){
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _isLoggedIn ? Dashboard() :  Login(),
      ),

    );
  }
}