import 'package:flutter/material.dart';
import '../atomos/campo_texto.dart';
import '../atomos/boton_principal.dart';
import '../../controlador/login_controlador.dart';
import '../paginas/perfil_pagina.dart';

class FormularioLogin extends StatefulWidget {
  const FormularioLogin({super.key});

  @override
  State<FormularioLogin> createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  final _controlador = LoginControlador();
  final _correo = TextEditingController();
  final _contrasena = TextEditingController();
  String mensaje = '';

  void _iniciarSesion() {
    bool ok = _controlador.iniciarSesion(_correo.text, _contrasena.text);
    setState(() {
      mensaje = ok ? 'Inicio de sesión exitoso' : 'Credenciales incorrectas';
    });
    if (ok) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PerfilPagina()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CampoTexto(etiqueta: 'Correo', controlador: _correo),
        const SizedBox(height: 16),
        CampoTexto(etiqueta: 'Contraseña', controlador: _contrasena, esContrasena: true),
        const SizedBox(height: 24),
        BotonPrincipal(texto: 'Iniciar sesión', onPressed: _iniciarSesion),
        const SizedBox(height: 12),
        Text(mensaje),
      ],
    );
  }
}
