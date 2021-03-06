import 'package:flutter/material.dart';
import 'login_screen.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Mais Informações'),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  title: Text(
                    'Projeto Prático Avaliativo de Ettore Leonardo Della Torre',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.black ,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Ettore(),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.message,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Esse APP visa ajudar nas despesas pessoais diárias',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(100),
                child: ListTile(
                  leading: Icon(
                    Icons.laptop_windows,
                    color: Colors.purple,
                  ),
                  title: Text(
                    'App em desenvolvimento',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.purple,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
