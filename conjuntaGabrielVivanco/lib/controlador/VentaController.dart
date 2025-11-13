import '../modelo/VentaModel.dart';

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
      return 'Complete los datos de la cafena';
    }

    if (sMonto.isEmpty) {
      return 'Ingrese el valor de la venta';
    }

    final monto = double.tryParse(sMonto);

    if (monto == null) {
      return 'Ingrese un valor valido';
    }

    if (monto <= 0) {
      return 'Ingrese un valor mayor a 0';
    }

    _modelo!.registrarVenta(ciudad, tienda, empleado, monto);
    return 'Venta registrada exitosamente';
  }

  VentaModelo? obtenerModelo() {
    return _modelo;
  }

  void calcularTotales() {
    if (_modelo != null) {
      _modelo!.acumularVentas();
    }
  }
}
