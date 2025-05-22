import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isActive});
  final Color color;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
          radius: 36,
          backgroundColor: Colors.white,
          child: CircleAvatar(backgroundColor: color, radius: 32),
        )
        : CircleAvatar(backgroundColor: color, radius: 32);
  }
}
