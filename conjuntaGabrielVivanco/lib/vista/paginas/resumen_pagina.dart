import 'package:flutter/material.dart';
import '../../temas/tema_fondo.dart';
import '../../temas/tipografia.dart';
import '../../controlador/venta_controlador.dart';
import '../atomos/tarjeta_info.dart';

class ResumenPagina extends StatelessWidget {
  const ResumenPagina({super.key});

  @override
  Widget build(BuildContext context) {
    final VentaControlador controlador = ModalRoute.of(context)!.settings.arguments as VentaControlador;
    final totales = controlador.obtenerResumen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de Ventas'),
      ),
      body: Container(
        decoration: FondoApp.degradadoPrincipal,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Resumen Total',
                style: TipografiaApp.titulo,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              
              TarjetaInfo(
                titulo: 'Total Cadena',
                valor: '\$${totales['totalCadena']?.toStringAsFixed(2) ?? "0.00"}',
                color: Colors.green,
              ),
              
              const SizedBox(height: 20),
              Text(
                'Ventas por Ciudad',
                style: TipografiaApp.subtitulo,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              
              _construirCardCiudades(totales),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirCardCiudades(Map<String, dynamic> totales) {
    final ciudades = totales['ciudades'] as List<dynamic>? ?? [];
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var ciudad in ciudades) ...[
              Text(
                ciudad['nombre'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Total: \$${ciudad['total'].toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              
              for (var tienda in ciudad['tiendas']) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tienda ${tienda['numero']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        'Total: \$${tienda['total'].toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      
                      for (var empleado in tienda['empleados']) ...[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            '${empleado['nombre']}: \$${empleado['venta'].toStringAsFixed(2)}',
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
