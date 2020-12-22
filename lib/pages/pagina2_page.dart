import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estados/services/usuario_services.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: usuarioService.existeUsuario
              ? Text('Usuario: ${usuarioService.usuario.nombre}')
              : Text('Usuario null')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: Text(
                  'Establecer Usuario',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  final newUser = new Usuario(nombre: 'Test1 ', edad: 34, profesiones: ['FullStack Developer', 'FrontEnd', 'Playing Gamer']);
                  usuarioService.usuario = newUser;
                }),
            MaterialButton(
                child: Text(
                  'Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioService.cambiarEdad(25);
                }),
            MaterialButton(
                child: Text(
                  'Add Profesion',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioService.agregarProfesion();
                }),
          ],
        ),
      ),
    );
  }
}
