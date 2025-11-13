import 'package:flutter/material.dart';
import '../../temas/tema_botones.dart';

class BotonPrincipal extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotonPrincipal({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: estiloBotonPrincipal,
      onPressed: onPressed,
      child: Text(texto),
    );
  }
}
