import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff3D3D3D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(icon, color: Colors.white, weight: 8),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
