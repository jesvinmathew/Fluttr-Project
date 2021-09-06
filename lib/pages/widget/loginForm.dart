
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ellie_fe/components/textWidget.dart';
//import 'package:ellie_fe/components/textInput.dart';
import 'package:ellie_fe/api/myApi.dart';
import 'dart:convert';


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  _showMsg(msg) { //
    final snackBar = SnackBar(
      backgroundColor: Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _login() async {
    var data = {
      'email' : emailController.text,
      'password' : textController.text,
    };

    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    print(body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushNamed(context, 'dashboard');
    }else{
      _showMsg(body['message']);
    }
  }

  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return Container(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text:"Here to Get1", fontSize:26, isUnderLine:false),
            TextWidget(text:"Welcomed !", fontSize:26, isUnderLine:false),
            SizedBox(height:height*0.1),
            /*
            SizedBox(height: height*.05,),
            TextInput(textString:"Password", textController:textController, hint:"Password", obscureText: true,),
            SizedBox(height: height*.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text:"Sign in", fontSize:22, isUnderLine:false),

                GestureDetector(
                    onTap: (){
                      _login();
                    },
                    child:
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape:BoxShape.circle,
                        color:Color(0xFF363f93),
                      ),
                      child: Icon(Icons.arrow_forward, color:Colors.white, size:30),
                    )
                )
              ],
            ),
            SizedBox(height:height*0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){

                  },
                  child:TextWidget(text:"Forgot Password", fontSize:16, isUnderLine:true),

                )
              ],
            )*/
          ],
        )
    );
  }
}
