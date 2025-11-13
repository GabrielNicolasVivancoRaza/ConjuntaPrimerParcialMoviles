import 'package:flutter/material.dart';

class CampoNumerico extends StatelessWidget {
  final String etiqueta;
  final TextEditingController controlador;
  final String? Function(String?)? validador;

  const CampoNumerico({
    super.key,
    required this.etiqueta,
    required this.controlador,
    this.validador,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlador,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: etiqueta,
      ),
    );
  }
}
