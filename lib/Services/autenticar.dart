
import 'package:expenses/screens/Registrar_screen.dart';
import 'package:expenses/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Autenticar extends StatefulWidget {
  @override
  _AutenticarState createState() => _AutenticarState();
}

class _AutenticarState extends State<Autenticar> {
  
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return Registrar(toggleView: toggleView);
    }else{
      return LoginScreen(toggleView: toggleView);
    }
  }
}