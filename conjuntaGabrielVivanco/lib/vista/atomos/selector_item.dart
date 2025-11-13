import 'package:flutter/material.dart';

class SelectorItem extends StatelessWidget {
  final String etiqueta;
  final int valor;
  final List<int> items;
  final Function(int?) onChanged;

  const SelectorItem({
    super.key,
    required this.etiqueta,
    required this.valor,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            etiqueta,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DropdownButton<int>(
          value: valor,
          items: items.map((item) {
            return DropdownMenuItem<int>(
              value: item,
              child: Text('${item + 1}'),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
