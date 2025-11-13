import 'package:flutter/material.dart';
import 'esquema_color.dart';

final InputDecorationTheme estiloFormulario = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  hintStyle: const TextStyle(color: ColoresApp.textoSecundario),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: ColoresApp.acento),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: ColoresApp.primario, width: 2),
  ),
);
