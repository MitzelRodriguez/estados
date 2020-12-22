import 'package:flutter/material.dart';
import '../models/usuario.dart';

class UsuarioService with ChangeNotifier{
  Usuario _usuario;

  // ignore: close_sinks
  // StreamController<Usuario> _usuarioStreamController =
  //     new StreamController<Usuario>.broadcast();

  Usuario get usuario => this._usuario;

  bool get existeUsuario => (this._usuario != null) ? true : false;

  set usuario (Usuario user){
    this._usuario = user;
    notifyListeners();
  }

  //Metodo cambiar edad
  void cambiarEdad(int edad){
    this._usuario.edad = edad;
    notifyListeners();
  }

  //metodo remover un usuario
  void removerUsuario(){
    this._usuario = null;
    notifyListeners();
  }

  //Metodo agregar profesion
  void agregarProfesion(){
    this.usuario.profesiones.add('Profesion: ${this._usuario.profesiones.length + 1}');
    notifyListeners();
  }

}


