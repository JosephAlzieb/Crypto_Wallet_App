import 'dart:ffi';
import 'dart:io';

import 'package:crypto_wallet/net/flutterFire.dart';
import 'package:crypto_wallet/ui/home_view.dart';
import 'package:crypto_wallet/widgets.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Crypto Wallet"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.blueAccent),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                getTextFormField(_email, "something@email.com", "Email", keyboardType:TextInputType.emailAddress ),
                getTextFormField(_password, "Password", "Password", keyboardType: TextInputType.visiblePassword, obscure: true),
                getTextButton("Login", context, () async {
                  bool shouldNavigate = await singIn(_email.text, _password.text);
                  if(shouldNavigate){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));
                  }
                }),
                getTextButton("Register", context, () async {
                  bool shouldNavigate =
                      await register(_email.text, _password.text);
                  if(shouldNavigate){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
