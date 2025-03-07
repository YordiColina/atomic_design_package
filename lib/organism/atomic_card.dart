import 'dart:async';
import 'package:flutter/material.dart';

class AtomicCard extends StatefulWidget {
  final String titulo;
  final double precio;
  final String imageUrl;
  final String categoria;

  const AtomicCard({
    Key? key,
    required this.titulo,
    required this.precio,
    required this.imageUrl,
    required this.categoria,
  }) : super(key: key);

  @override
  _AtomicCardState createState() => _AtomicCardState();
}

class _AtomicCardState extends State<AtomicCard> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {}); // 🔥 Verifica que el widget sigue montado antes de actualizar el estado
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // 🔥 Cancela el Timer para evitar errores en los tests
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(widget.imageUrl, errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.broken_image); // 🔥 Evita fallos si la imagen no carga
          }),
          Text(widget.titulo),
          Text('\$${widget.precio.toStringAsFixed(2)}'),
          Text(widget.categoria),
        ],
      ),
    );
  }
}
