import 'package:flutter/material.dart';
import '../../temas/tema_fondo.dart';
import '../../temas/tipografia.dart';
import '../../controlador/venta_controlador.dart';
import '../moleculas/formulario_configuracion.dart';

class ConfiguracionPagina extends StatefulWidget {
  const ConfiguracionPagina({super.key});

  @override
  State<ConfiguracionPagina> createState() => _ConfiguracionPaginaState();
}

class _ConfiguracionPaginaState extends State<ConfiguracionPagina> {
  final _controlador = VentaControlador();
  final _ciudadesController = TextEditingController();
  final _tiendasController = TextEditingController();
  final _empleadosController = TextEditingController();

  void _configurarYNavegar() {
    final resultado = _controlador.inicializarCadena(
      _ciudadesController.text,
      _tiendasController.text,
      _empleadosController.text,
    );

    if (resultado == 'OK') {
      Navigator.pushNamed(
        context,
        '/seleccion',
        arguments: _controlador,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(resultado)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('El Mandilón (Carlitos Rivera)'),
      ),
      body: Container(
        decoration: FondoApp.degradadoPrincipal,
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Cadena El Mandilón',
                  style: TipografiaApp.titulo,
                ),
                const SizedBox(height: 10),
                Text(
                  'Configure la estructura de la cadena',
                  style: TipografiaApp.subtitulo,
                ),
                const SizedBox(height: 30),
                FormularioConfiguracion(
                  ciudadesController: _ciudadesController,
                  tiendasController: _tiendasController,
                  empleadosController: _empleadosController,
                  onConfigurar: _configurarYNavegar,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ciudadesController.dispose();
    _tiendasController.dispose();
    _empleadosController.dispose();
    super.dispose();
  }
}
