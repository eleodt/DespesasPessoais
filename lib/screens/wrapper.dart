

import 'package:expenses/screens/Registrar_screen.dart';

import 'package:expenses/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    return user == null ? LoginScreen() :  Registrar();
  }
}