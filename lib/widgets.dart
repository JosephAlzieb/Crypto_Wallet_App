import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget getTextFormField(var controller, String hintText, String label,{obscure = false, TextInputType keyboardType = TextInputType.text}) {
  return TextFormField(
    obscureText: obscure,
    keyboardType: keyboardType,
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}

Widget getTextButton(var text, var context, Function onPressed) {
  return Container(
    height: MediaQuery.of(context).size.height / 8,
    child: TextButton(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 25),
      ),
      onPressed: onPressed,
    ),
  );
}
