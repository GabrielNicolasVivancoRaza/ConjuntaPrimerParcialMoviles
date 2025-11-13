import 'package:flutter/material.dart';
import '../../temas/tema_fondo.dart';
import '../../temas/tipografia.dart';
import '../../controlador/VentaController.dart';
import '../atomos/selector_item.dart';
import '../atomos/boton_principal.dart';

class SeleccionPagina extends StatefulWidget {
  const SeleccionPagina({super.key});

  @override
  State<SeleccionPagina> createState() => _SeleccionPaginaState();
}

class _SeleccionPaginaState extends State<SeleccionPagina> {
  int _ciudadSeleccionada = 0;
  int _tiendaSeleccionada = 0;
  int _empleadoSeleccionado = 0;
  
  late VentaControlador _controlador;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controlador = ModalRoute.of(context)!.settings.arguments as VentaControlador;
  }

  void _navegarARegistro() {
    Navigator.pushNamed(
      context,
      '/registro',
      arguments: {
        'controlador': _controlador,
        'ciudadIndex': _ciudadSeleccionada,
        'tiendaIndex': _tiendaSeleccionada,
        'empleadoIndex': _empleadoSeleccionado,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final modelo = _controlador.obtenerModelo();

    if (modelo == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Modelo no inicializado')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selección de Ubicación'),
      ),
      body: Container(
        decoration: FondoApp.degradadoPrincipal,
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Seleccione Ubicación',
                  style: TipografiaApp.titulo,
                ),
                const SizedBox(height: 30),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SelectorItem(
                          etiqueta: 'Ciudad:',
                          valor: _ciudadSeleccionada,
                          items: List.generate(modelo.numCiudades, (i) => i),
                          onChanged: (val) => setState(() => _ciudadSeleccionada = val ?? 0),
                        ),
                        const SizedBox(height: 16),
                        SelectorItem(
                          etiqueta: 'Tienda:',
                          valor: _tiendaSeleccionada,
                          items: List.generate(modelo.numTiendas, (i) => i),
                          onChanged: (val) => setState(() => _tiendaSeleccionada = val ?? 0),
                        ),
                        const SizedBox(height: 16),
                        SelectorItem(
                          etiqueta: 'Empleado:',
                          valor: _empleadoSeleccionado,
                          items: List.generate(modelo.numEmpleados, (i) => i),
                          onChanged: (val) => setState(() => _empleadoSeleccionado = val ?? 0),
                        ),
                        const SizedBox(height: 24),
                        BotonPrincipal(
                          texto: 'Registrar Venta',
                          onPressed: _navegarARegistro,
                        ),
                        const SizedBox(height: 12),
                        BotonPrincipal(
                          texto: 'Ver Resumen',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/resumen',
                              arguments: _controlador,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
