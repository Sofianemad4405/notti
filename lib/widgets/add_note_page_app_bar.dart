import 'package:flutter/material.dart';
import 'package:notti/widgets/app_bar_icon.dart';

class CustomAddNotePageAppBar extends StatelessWidget {
  const CustomAddNotePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarIcon(
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.pop(context),
        ),
        Row(
          children: [
            AppBarIcon(icon: Icons.visibility, onPressed: () {}),
            SizedBox(width: 20),
            AppBarIcon(icon: Icons.save_outlined, onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
