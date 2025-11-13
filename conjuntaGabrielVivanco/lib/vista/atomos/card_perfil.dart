import 'package:flutter/material.dart';
import '../../temas/tipografia.dart';
import '../../temas/esquema_color.dart';

class CardPerfil extends StatelessWidget {
  final String nombre;
  final int edad;
  final String descripcion;
  final String? imagenUrl;

  const CardPerfil({
    super.key,
    required this.nombre,
    required this.edad,
    required this.descripcion,
    this.imagenUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Espacio para la imagen
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: ColoresApp.primario.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: imagenUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagenUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            size: 40,
                            color: ColoresApp.primario,
                          );
                        },
                      ),
                    )
                  : const Icon(
                      Icons.person,
                      size: 40,
                      color: ColoresApp.primario,
                    ),
            ),
            const SizedBox(width: 16),
            // Información del perfil
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: TipografiaApp.subtitulo.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$edad años',
                    style: TipografiaApp.texto.copyWith(
                      color: ColoresApp.textoSecundario,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    descripcion,
                    style: TipografiaApp.texto.copyWith(
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
