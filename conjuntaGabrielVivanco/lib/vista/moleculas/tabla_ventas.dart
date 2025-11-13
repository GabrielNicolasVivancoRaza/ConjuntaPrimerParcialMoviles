import 'package:flutter/material.dart';
import '../../modelo/venta_modelo.dart';

class TablaVentas extends StatelessWidget {
  final VentaModelo modelo;

  const TablaVentas({
    super.key,
    required this.modelo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Ciudad')),
              DataColumn(label: Text('Tienda')),
              DataColumn(label: Text('Empleado')),
              DataColumn(label: Text('Venta')),
            ],
            rows: _construirFilas(),
          ),
        ),
      ),
    );
  }

  List<DataRow> _construirFilas() {
    List<DataRow> filas = [];
    
    for (int c = 0; c < modelo.numCiudades; c++) {
      for (int t = 0; t < modelo.numTiendas; t++) {
        for (int e = 0; e < modelo.numEmpleados; e++) {
          filas.add(DataRow(
            cells: [
              DataCell(Text('Ciudad ${c + 1}')),
              DataCell(Text('Tienda ${t + 1}')),
              DataCell(Text('Empleado ${e + 1}')),
              DataCell(Text('\$${modelo.obtenerVentaEmpleado(c, t, e).toStringAsFixed(2)}')),
            ],
          ));
        }
      }
    }
    
    return filas;
  }
}
