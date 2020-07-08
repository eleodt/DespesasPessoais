import './Third_screen.dart';
import 'package:expenses/main.dart';
import 'package:expenses/screens/Registrar_screen.dart';

import '../Services/auth.dart';

import 'package:flutter/material.dart';


    

class LoginScreen extends StatefulWidget {
  
  final Function toggleView;
  LoginScreen({this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String senha = '';
  String erro = '';
  bool loading=false;

  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            'Login',
          ),
           actions: <Widget>[
            
          ],
        ),
        body: Container(
          child: Form(
            key: _formKey,
          child: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: User(),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                validator: (val) =>val.isEmpty ? 'Entre um Email' : null,
                onChanged: (val){
                  setState(()=> email = val);
                },
                decoration: InputDecoration(
                  labelText: 'Nome do Usuário',
                  icon: Icon(Icons.people_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                validator: (val) =>val.length < 6 ? 'Entre com uma senha maior que 6 dígitos' : null,
                  obscureText: true,
                  onChanged: (val){
        
                  setState(()=> senha = val);
                     },
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      icon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 160),
              child: Builder(
                builder: (context) => RaisedButton(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                      setState(() {
                            loading = true;
                          });
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true );
                            dynamic result = await _auth.signInWithEmailAndPassword(email, senha); 
                            if (result == null) {
                              setState(() => loading = true );
                              print('error signing in');
                            } else {
                              print('signed in');
                              print(result.uid);
                              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExpensesApp()));
                            }
                          }
                  },
                  padding: EdgeInsets.all(16),
                  color: Colors.purple,
                  child: Text('Logar', style: TextStyle(color: Colors.white)),
                ),
                
              ),
              
            ),
            SizedBox(height: 12.0,),
            Text(
              erro,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 160),
              child: Builder(
                builder: (context) => RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: ()  {
                    
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registrar()));
                  
                  },
                  padding: EdgeInsets.all(16),
                  color: Colors.purple,
                  child: Text('Registrar', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 0),
              child: Builder(
                builder: (context) => RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: ()  {
                 Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Information()));
                  },
                  padding: EdgeInsets.all(16),
                  color: Colors.purple,
                  child: Text('Sobre', style: TextStyle(color: Colors.white)),
                ),
              ),
            )
          ]),
        ),
        
      ),
      )
    );
  }
}

class Ettore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/Ettore.jpeg');
    Image image = Image(
      image: assetImage,
      width: 250,
      height: 250,
    );
    return Container(child: image);
  }
}

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/user.jpg');
    Image image = Image(
      image: assetImage,
      width: 200,
      height: 200,
    );
    return Container(child: image);
  }
}
