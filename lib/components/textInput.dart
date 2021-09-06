import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String textString;
  final String hint;
  bool obscureText;

  TextInput(
      {Key? key, required this.textString, required this.hint, this.obscureText = false}) : super(key: key);

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'js@mail.com'
        ),
      ),
    );
  }
}