import 'package:flutter/material.dart';
import 'esquema_color.dart';

class FondoApp {
  static const BoxDecoration degradadoPrincipal = BoxDecoration(
    gradient: LinearGradient(
      colors: [ColoresApp.primario, ColoresApp.secundario],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static const BoxDecoration fondoClaro = BoxDecoration(
    color: ColoresApp.fondo,
  );
}
