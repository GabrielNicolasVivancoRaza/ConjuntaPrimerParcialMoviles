class VentaModelo {
  final int numCiudades;
  final int numTiendas;
  final int numEmpleados;
  final List<List<List<double>>> ventas;

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

  double calcularVentaTienda(int ciudad, int tienda) {
    double total = 0.0;
    for (int e = 0; e < numEmpleados; e++) {
      total += ventas[ciudad][tienda][e];
    }
    return total;
  }

  double calcularVentaCiudad(int ciudad) {
    double total = 0.0;
    for (int t = 0; t < numTiendas; t++) {
      total += calcularVentaTienda(ciudad, t);
    }
    return total;
  }

  double calcularTotalCadena() {
    double total = 0.0;
    for (int c = 0; c < numCiudades; c++) {
      total += calcularVentaCiudad(c);
    }
    return total;
  }
}
