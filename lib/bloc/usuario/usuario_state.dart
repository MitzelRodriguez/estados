
part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState{

}

class UsuarioInit extends UsuarioState{
  final existeUsuario = false;
}

class UsuarioActivo extends UsuarioState{
  final existeUsuario = true;

  //Importar modelo del Usuario
final Usuario usuario;

UsuarioActivo(this.usuario);
}