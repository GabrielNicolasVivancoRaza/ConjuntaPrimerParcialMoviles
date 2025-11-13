class VentaModelo {
  final int numCiudades;
  final int numTiendas;
  final int numEmpleados;
  final List<List<List<double>>> ventas;
  
  // Atributos para totales
  double ventaEmpleado = 0.0;
  double ventaTienda = 0.0;
  double ventaCiudad = 0.0;
  double totalCadena = 0.0;

  VentaModelo({
    required this.numCiudades,
    required this.numTiendas,
    required this.numEmpleados,
  }) : ventas = List.generate(
          numCiudades,
          (_) => List.generate(
            numTiendas,
            (_) => List.generate(numEmpleados, (_) => 0.0),
          ),
        );

  void registrarVenta(int ciudad, int tienda, int empleado, double monto) {
    ventas[ciudad][tienda][empleado] += monto;
  }

  double obtenerVentaEmpleado(int ciudad, int tienda, int empleado) {
    return ventas[ciudad][tienda][empleado];
  }

  void acumularVentas() {
    totalCadena = 0.0;
    
    for (int c = 0; c < numCiudades; c++) {
      ventaCiudad = 0.0;
      
      for (int t = 0; t < numTiendas; t++) {
        ventaTienda = 0.0;
        
        for (int e = 0; e < numEmpleados; e++) {
          ventaEmpleado = ventas[c][t][e];
          ventaTienda += ventaEmpleado;
        }
        
        ventaCiudad += ventaTienda;
      }
      
      totalCadena += ventaCiudad;
    }
  }

  double obtenerTotalCiudad(int ciudad) {
    double total = 0.0;
    for (int t = 0; t < numTiendas; t++) {
      for (int e = 0; e < numEmpleados; e++) {
        total += ventas[ciudad][t][e];
      }
    }
    return total;
  }

  double obtenerTotalTienda(int ciudad, int tienda) {
    double total = 0.0;
    for (int e = 0; e < numEmpleados; e++) {
      total += ventas[ciudad][tienda][e];
    }
    return total;
  }
}
