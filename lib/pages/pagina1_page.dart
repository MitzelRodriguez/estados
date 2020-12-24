import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_cubit.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                // ignore: deprecated_member_use
                context.bloc<UsuarioCubit>().borrarUsuario();}
              ),
        ],
      ),
      body: BoddyScaffold(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next_outlined),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class BoddyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInit:
            return Center(
              child: Text('No hay informacion del usuario'),
            );
          case UsuarioActivo:
            return informacionUsuario((state as UsuarioActivo).usuario);
            break;
          default:
            return Center(child: Text('Estado no reconocido'));
        }
      },
    );
  }
}

// ignore: camel_case_types
class informacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const informacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList(),
        ],
      ),
    );
  }
}
