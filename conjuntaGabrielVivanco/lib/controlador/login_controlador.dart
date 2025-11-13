import '../modelo/usuario_modelo.dart';

class LoginControlador {
  final _usuario = Usuario(correo: 'admin', contrasena: 'admin');

  bool iniciarSesion(String correo, String contrasena) {
    return correo == _usuario.correo && contrasena == _usuario.contrasena;
  }
}
