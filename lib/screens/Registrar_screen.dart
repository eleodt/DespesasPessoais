import 'package:expenses/Services/auth.dart';
import 'package:expenses/screens/login_screen.dart';
import 'package:flutter/material.dart';


class Registrar extends StatefulWidget {
  
  final Function toggleView;
  Registrar({this.toggleView});

  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  
  String erro = '';
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            'Registro',
          ),
         
        ),
        body: Container(  
          padding: EdgeInsets.symmetric(vertical:20, horizontal:20),
          child: Form(
            key: _formKey,
          child: ListView(children: <Widget>[
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
                  obscureText: true,
                  validator: (val) =>val.length < 6 ? 'Entre com uma senha maior que 6 dígitos' : null,
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
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 110),
              child: Builder(
                builder: (context) => RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                   if(_formKey.currentState.validate()){
                     dynamic resultado = await _auth.registerWithEmailESenha(email, senha);
                     if (resultado == null){
                       setState(()=> erro = 'Entre com um Email válido');
                     }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                     }
                   }
                  },
                  padding: EdgeInsets.all(16),
                  color: Colors.purple,
                  child: Text('Registrar', style: TextStyle(color: Colors.white)),
                ),
                
                
              ),
            ),
                  Padding(
              padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 16),
              child: Builder(
                builder: (context) => RaisedButton(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  padding: EdgeInsets.all(16),
                  color: Colors.purple,
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                ),
                
              ),
              
            ),
            SizedBox(height: 12.0,),
            Text(
              erro,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ]
          ),
          
        ),
        
      ),
      
      )
      
    );
    
  }
}