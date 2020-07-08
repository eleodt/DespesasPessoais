

import 'dart:ffi';
import 'dart:typed_data';
import 'dart:wasm';

import 'package:flutter/cupertino.dart';

class Ususario {
  
  final String uid;
  Ususario({this.uid});
  
}

class Contas{
  final String id;
  final String nome;
  final String preco;
  final bool ativo;
  
  const Contas({
    this.id,
    @required this.nome,
    @required this.preco,
    @required this.ativo,
  });
}