import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String etiqueta;
  final TextEditingController controlador;
  final bool esContrasena;

  const CampoTexto({
    super.key,
    required this.etiqueta,
    required this.controlador,
    this.esContrasena = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlador,
      obscureText: esContrasena,
      decoration: InputDecoration(labelText: etiqueta),
    );
  }
}
