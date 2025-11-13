import 'package:flutter/material.dart';
import 'esquema_color.dart';

final ButtonStyle estiloBotonPrincipal = ElevatedButton.styleFrom(
  backgroundColor: ColoresApp.primario,
  foregroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
);
