import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF2F2F2),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          ),
        ),
        width: double.maxFinite,
        height: 77,
        child: child,
      ),
    );
  }
}
