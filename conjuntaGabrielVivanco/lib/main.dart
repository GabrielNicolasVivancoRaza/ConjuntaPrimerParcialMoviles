import 'package:flutter/material.dart';
import 'temas/indice.dart';
import 'vista/paginas/configuracion_pagina.dart';
import 'vista/paginas/seleccion_pagina.dart';
import 'vista/paginas/registro_venta_pagina.dart';
import 'vista/paginas/resumen_pagina.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Mandilón',
      debugShowCheckedModeBanner: false,
      theme: temaGeneral,
      initialRoute: '/',
      routes: {
        '/': (context) => const ConfiguracionPagina(),
        '/seleccion': (context) => const SeleccionPagina(),
        '/registro': (context) => const RegistroVentaPagina(),
        '/resumen': (context) => const ResumenPagina(),
      },
    );
  }
}
