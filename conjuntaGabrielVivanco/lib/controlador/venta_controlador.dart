import '../modelo/venta_modelo.dart';

class VentaControlador {
  VentaModelo? _modelo;

  String inicializarCadena(String sCiudades, String sTiendas, String sEmpleados) {
    if (sCiudades.isEmpty || sTiendas.isEmpty || sEmpleados.isEmpty) {
      return 'Complete todos los campos';
    }

    final ciudades = int.tryParse(sCiudades);
    final tiendas = int.tryParse(sTiendas);
    final empleados = int.tryParse(sEmpleados);

    if (ciudades == null || tiendas == null || empleados == null) {
      return 'Ingrese numeros enteros';
    }

    if (ciudades <= 0 || tiendas <= 0 || empleados <= 0) {
      return 'Los valores debe ser mayores a 0';
    }

    _modelo = VentaModelo(
      numCiudades: ciudades,
      numTiendas: tiendas,
      numEmpleados: empleados,
    );

    return 'OK';
  }

  String registrarVenta(String sMonto, int ciudad, int tienda, int empleado) {
    if (_modelo == null) {
      return 'Debe configurar la cadena primero';
    }

    if (sMonto.isEmpty) {
      return 'Ingrese el monto de la venta';
    }

    final monto = double.tryParse(sMonto);

    if (monto == null) {
      return 'Ingrese un monto válido';
    }

    if (monto <= 0) {
      return 'El monto debe ser mayor a 0';
    }

    _modelo!.registrarVenta(ciudad, tienda, empleado, monto);
    return 'Venta registrada exitosamente';
  }

  VentaModelo? obtenerModelo() {
    return _modelo;
  }

  Map<String, dynamic> obtenerResumen() {
    if (_modelo == null) {
      return {};
    }

    return {
      'totalCadena': _modelo!.calcularTotalCadena(),
      'ciudades': List.generate(_modelo!.numCiudades, (c) {
        return {
          'nombre': 'Ciudad ${c + 1}',
          'total': _modelo!.calcularVentaCiudad(c),
          'tiendas': List.generate(_modelo!.numTiendas, (t) {
            return {
              'numero': t + 1,
              'total': _modelo!.calcularVentaTienda(c, t),
              'empleados': List.generate(_modelo!.numEmpleados, (e) {
                return {
                  'nombre': 'Empleado ${e + 1}',
                  'venta': _modelo!.obtenerVentaEmpleado(c, t, e),
                };
              }),
            };
          }),
        };
      }),
    };
  }
}
