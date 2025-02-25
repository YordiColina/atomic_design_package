import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../organism/atomic_detail_card.dart';

class AtomicHorizontalCardListTemplate extends StatefulWidget {
  final String title;
  final dynamic items;
  final Color? backgroundListColor;
  final TextSize? textSize;
  final Color? titleColor;
  final Color? cardColor;
  final Color? borderCardColor;
  final Function()? onTapFunction;
  final double? heightOfContainerList;
  final FontWeight? fontWeight;

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
    this.borderCardColor,
  });

  @override
  _AtomicHorizontalCardListTemplateState createState() =>
      _AtomicHorizontalCardListTemplateState();
}

class _AtomicHorizontalCardListTemplateState
    extends State<AtomicHorizontalCardListTemplate> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingForward = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() async {
    while (mounted) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double minScroll = _scrollController.position.minScrollExtent;
        double targetScroll = _isScrollingForward ? maxScroll : minScroll;

        await _scrollController.animateTo(
          targetScroll,
          duration: const Duration(seconds: 4),
          curve: Curves.linear,
        );

        if (mounted) {
          setState(() {
            _isScrollingForward = !_isScrollingForward;
          });
        }
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  void dispose() {
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
                      child: AtomicDetailCard(
                        cardColor: widget.cardColor,
                        borderCardColor: widget.borderCardColor,
                        titulo: item['title'],
                        precio: item['price'],
                        imageUrl: item['image'],
                        categoria: item['category'],
                        descripcion: item['description'],
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
                      child: AtomicDetailCard(
                        cardColor: widget.cardColor,
                        borderCardColor: widget.borderCardColor,
                        titulo: item['title'],
                        precio: item['price'],
                        imageUrl: item['image'],
                        categoria: item['category'],
                        descripcion: item['description'],
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
