import 'package:flutter/material.dart';
import '../../temas/tema_fondo.dart';
import '../../temas/tipografia.dart';
import '../../controlador/VentaController.dart';
import '../atomos/tarjeta_info.dart';

class ResumenPagina extends StatelessWidget {
  const ResumenPagina({super.key});

  @override
  Widget build(BuildContext context) {
    final VentaControlador controlador = ModalRoute.of(context)!.settings.arguments as VentaControlador;
    final modelo = controlador.obtenerModelo();
    
    if (modelo == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('No hay datos disponibles')),
      );
    }
    
    controlador.calcularTotales();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen ventas'),
      ),
      body: Container(
        decoration: FondoApp.degradadoPrincipal,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Total',
                style: TipografiaApp.titulo,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              
              TarjetaInfo(
                titulo: 'Total de la cadena',
                valor: '\$${modelo.totalCadena.toStringAsFixed(2)}',
                color: Colors.green,
              ),
              
              const SizedBox(height: 20),
              Text(
                'Ventas por ciudad',
                style: TipografiaApp.subtitulo,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              
              _construirCardCiudades(modelo),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirCardCiudades(modelo) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int c = 0; c < modelo.numCiudades; c++) ...[
              Text(
                'Ciudad ${c + 1}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Total: \$${modelo.obtenerTotalCiudad(c).toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              
              for (int t = 0; t < modelo.numTiendas; t++) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tienda ${t + 1}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        'Total: \$${modelo.obtenerTotalTienda(c, t).toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      
                      for (int e = 0; e < modelo.numEmpleados; e++) ...[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Empleado ${e + 1}: \$${modelo.obtenerVentaEmpleado(c, t, e).toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
              const Divider(),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}
