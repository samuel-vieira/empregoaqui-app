import 'package:flutter/material.dart';

enum CardType {
  homeCard,
  vagaCard,
}

class CardComponent extends StatelessWidget {
  const CardComponent({
    required this.child,
    required this.type,
    super.key,
  });

  final Widget child;
  final CardType type;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          ),
        ),
        width: double.maxFinite,
        height: setHeight(),
        child: child,
      ),
    );
  }

  double setHeight() {
    return switch (type) {
      CardType.homeCard => 77,
      CardType.vagaCard => 100,
    };
  }
}
