import 'package:flutter/material.dart';
import '../../temas/tipografia.dart';
import '../../temas/tema_fondo.dart';
import '../../temas/tema_botones.dart';
import '../atomos/card_perfil.dart';
import 'login_pagina.dart';

class PerfilPagina extends StatelessWidget {
  const PerfilPagina({super.key});

  void _cerrarSesion(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPagina()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil de Usuario')),
      body: Container(
        decoration: FondoApp.fondoClaro,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Equipo de Desarrollo', style: TipografiaApp.titulo),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  CardPerfil(
                    nombre: 'Samir Mideros',
                    edad: 23,
                    descripcion: 'Estudiante de Ingeniería de Software en la Universidad de las Fuerzas Armadas ESPE',
                    imagenUrl: 'assets/images/zhumir.jpeg',
                  ),
                  SizedBox(height: 12),
                  CardPerfil(
                    nombre: 'Alison Miranda',
                    edad: 21,
                    descripcion: 'Estudiante de Ingeniería de Software en la Universidad de las Fuerzas Armadas ESPE',
                    imagenUrl: 'assets/images/niñaAli.jpeg',
                  ),
                  SizedBox(height: 12),
                  CardPerfil(
                    nombre: 'David Moran',
                    edad: 21,
                    descripcion: 'Estudiante de Ingeniería de Software en la Universidad de las Fuerzas Armadas ESPE',
                    imagenUrl: 'assets/images/davidMoran.png',
                  ),
                  SizedBox(height: 12),
                  CardPerfil(
                    nombre: 'Gabriel Vivanco',
                    edad: 22,
                    descripcion: 'Estudiante de Ingeniería de Software en la Universidad de las Fuerzas Armadas ESPE',
                    imagenUrl: 'assets/images/gaborabo.jpeg',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: estiloBotonPrincipal,
              onPressed: () => _cerrarSesion(context),
              child: const Text('Cerrar sesión'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
