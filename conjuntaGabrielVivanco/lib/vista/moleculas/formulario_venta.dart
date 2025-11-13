import 'package:flutter/material.dart';
import '../atomos/campo_numerico.dart';
import '../atomos/boton_principal.dart';

class FormularioVenta extends StatelessWidget {
  final TextEditingController montoController;
  final VoidCallback onRegistrar;

  const FormularioVenta({
    super.key,
    required this.montoController,
    required this.onRegistrar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CampoNumerico(
              etiqueta: 'Monto de Venta',
              controlador: montoController,
            ),
            const SizedBox(height: 16),
            BotonPrincipal(
              texto: 'Registrar Venta',
              onPressed: onRegistrar,
            ),
          ],
        ),
      ),
    );
  }
}
