import 'package:flutter/material.dart';
import '../atomos/campo_numerico.dart';
import '../atomos/boton_principal.dart';

class FormularioConfiguracion extends StatelessWidget {
  final TextEditingController ciudadesController;
  final TextEditingController tiendasController;
  final TextEditingController empleadosController;
  final VoidCallback onConfigurar;

  const FormularioConfiguracion({
    super.key,
    required this.ciudadesController,
    required this.tiendasController,
    required this.empleadosController,
    required this.onConfigurar,
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
              etiqueta: 'Numero de ciudades',
              controlador: ciudadesController,
            ),
            const SizedBox(height: 16),
            CampoNumerico(
              etiqueta: 'Tiendas por ciudad',
              controlador: tiendasController,
            ),
            const SizedBox(height: 16),
            CampoNumerico(
              etiqueta: 'Empleados por tienda',
              controlador: empleadosController,
            ),
            const SizedBox(height: 24),
            BotonPrincipal(
              texto: 'Configurar',
              onPressed: onConfigurar,
            ),
          ],
        ),
      ),
    );
  }
}
