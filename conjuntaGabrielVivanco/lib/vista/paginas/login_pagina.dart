import 'package:flutter/material.dart';
import '../../temas/tema_fondo.dart';
import '../../temas/tipografia.dart';
import '../moleculas/formulario_login.dart';

class LoginPagina extends StatelessWidget {
  const LoginPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: FondoApp.degradadoPrincipal,
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Bienvenido', style: TipografiaApp.titulo),
                const SizedBox(height: 20),
                const FormularioLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
