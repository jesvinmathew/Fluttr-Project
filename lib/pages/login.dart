import 'package:flutter/material.dart';
import 'package:ellie_fe/pages/widget/loinDisplay.dart';
import 'package:ellie_fe/pages/widget/loginForm.dart';
import 'package:ellie_fe/responsive.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 30, right: 40),
        child:Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (!Responsive.isMobile(context))
                LoinDisplay(),
              LoginForm(),
            ]
        )
    );
  }
}

