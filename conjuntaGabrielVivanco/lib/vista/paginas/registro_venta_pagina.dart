import 'package:flutter/material.dart';
import '../../temas/tema_fondo.dart';
import '../../temas/tipografia.dart';
import '../../controlador/venta_controlador.dart';
import '../moleculas/formulario_venta.dart';

class RegistroVentaPagina extends StatefulWidget {
  const RegistroVentaPagina({super.key});

  @override
  State<RegistroVentaPagina> createState() => _RegistroVentaPaginaState();
}

class _RegistroVentaPaginaState extends State<RegistroVentaPagina> {
  late VentaControlador _controlador;
  late int _ciudadIndex;
  late int _tiendaIndex;
  late int _empleadoIndex;
  final _montoController = TextEditingController();
  double _totalRegistrado = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _controlador = args['controlador'];
    _ciudadIndex = args['ciudadIndex'];
    _tiendaIndex = args['tiendaIndex'];
    _empleadoIndex = args['empleadoIndex'];
  }

  void _registrarVenta() {
    final resultado = _controlador.registrarVenta(
      _montoController.text,
      _ciudadIndex,
      _tiendaIndex,
      _empleadoIndex,
    );

    if (resultado == 'Venta registrada exitosamente') {
      final monto = double.parse(_montoController.text);
      setState(() {
        _totalRegistrado += monto;
      });
      _montoController.clear();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(resultado),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Venta'),
      ),
      body: Container(
        decoration: FondoApp.degradadoPrincipal,
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Registrar Venta',
                  style: TipografiaApp.titulo,
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ciudad: Ciudad ${_ciudadIndex + 1}'),
                        Text('Tienda: ${_tiendaIndex + 1}'),
                        Text('Empleado: Empleado ${_empleadoIndex + 1}'),
                        const SizedBox(height: 8),
                        Text(
                          'Total registrado: \$${_totalRegistrado.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FormularioVenta(
                  montoController: _montoController,
                  onRegistrar: _registrarVenta,
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
    _montoController.dispose();
    super.dispose();
  }
}
