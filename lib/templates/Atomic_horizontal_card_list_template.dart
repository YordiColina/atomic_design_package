import 'dart:async';

import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../organism/atomic_detail_card.dart';

class AtomicHorizontalCardListTemplate extends StatefulWidget {

/// Título que se mostrará en la parte superior del componente.
  final String title;

  /// Lista de elementos que se representarán como tarjetas.
  final dynamic items;

  /// color de fondo de la lista de items
  final Color? backgroundListColor;

  /// tamaño del titulo
  final TextSize? textSize;

  /// color del título
  final Color? titleColor;

  /// El color de la tarjeta.
  final Color? cardColor;

  /// El color del borde la tarjeta.
  final Color? borderCardColor;

  /// Función del onTap de la tarjeta
  final Function()? onTapFunction;

  /// altura de la lista de items
  final double? heightOfContainerList;

  /// peso de la fuente
  final FontWeight? fontWeight;

  /// El color de la letra tarjeta.
  final Color? cardTextColor;

  const AtomicHorizontalCardListTemplate({
    super.key,
    required this.title,
    required this.items,
    this.backgroundListColor,
    this.textSize,
    this.titleColor,
    this.fontWeight,
    this.heightOfContainerList,
    this.onTapFunction,
    this.cardColor,
    this.borderCardColor, this.cardTextColor,
  });

  @override
  _AtomicHorizontalCardListTemplateState createState() =>
      _AtomicHorizontalCardListTemplateState();
}

class _AtomicHorizontalCardListTemplateState
    extends State<AtomicHorizontalCardListTemplate> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingForward = true;
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }


  void _startAutoScroll() {
    if (!mounted || !_scrollController.hasClients) return;

    double maxScroll = _scrollController.position.maxScrollExtent;
    double minScroll = _scrollController.position.minScrollExtent;
    double targetScroll = _isScrollingForward ? maxScroll : minScroll;

    _scrollTimer = Timer(const Duration(seconds: 1), () {
      if (mounted && _scrollController.hasClients) {
        _scrollController.animateTo(
          targetScroll,
          duration: const Duration(seconds: 4),
          curve: Curves.linear,
        ).then((_) {
          if (mounted) {
            setState(() {
              _isScrollingForward = !_isScrollingForward;
            });

            _startAutoScroll();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel(); // 🔴 Cancelamos el Timer al desmontar el widget
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundListColor ?? Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: AtomicText(
                text: widget.title,
                size: widget.textSize ?? TextSize.medium,
                fontWeight: widget.fontWeight ?? FontWeight.bold,
                textAlign: TextAlign.center,
                color: widget.titleColor ?? Colors.black,
              ),
            ),
            const SizedBox(height: 16),
          widget.heightOfContainerList != null ?  SizedBox(
              height: widget.heightOfContainerList,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        final Function()? callback =
                            widget.onTapFunction ?? item['onTapFunction'];
                        callback?.call();
                      },
                      child: SizedBox(
                        width: 300,
                        child: AtomicDetailCard(
                          cardColor: widget.cardColor,
                          cardTextColor: widget.cardTextColor,
                          borderCardColor: widget.borderCardColor,
                          titulo: item['title'],
                          precio: item['price'],
                          imageUrl: item['image'],
                          categoria: item['category'],
                          descripcion: item['description'],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ):
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        final Function()? callback =
                            widget.onTapFunction ?? item['onTapFunction'];
                        callback?.call();
                      },
                      child: SizedBox(
                        width: 300,
                        child: AtomicDetailCard(
                          cardColor: widget.cardColor,
                          cardTextColor: widget.cardTextColor,
                          borderCardColor: widget.borderCardColor,
                          titulo: item['title'],
                          precio: item['price'],
                          imageUrl: item['image'],
                          categoria: item['category'],
                          descripcion: item['description'],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
