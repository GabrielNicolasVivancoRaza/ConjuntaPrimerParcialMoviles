import 'package:flutter/material.dart';

class TarjetaInfo extends StatelessWidget {
  final String titulo;
  final String valor;
  final Color? color;

  const TarjetaInfo({
    super.key,
    required this.titulo,
    required this.valor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              valor,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: color ?? Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
