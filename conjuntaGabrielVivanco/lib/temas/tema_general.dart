import 'package:flutter/material.dart';
import 'tema_appbar.dart';
import 'tema_formulario.dart';

final temaGeneral = ThemeData(
  appBarTheme: appBarTema,
  inputDecorationTheme: estiloFormulario,
  useMaterial3: true,
  brightness: Brightness.light,
);
