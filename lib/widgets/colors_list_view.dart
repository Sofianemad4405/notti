import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notti/cubits/notes_cubit.dart';
import 'package:notti/widgets/color_item.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key, required this.color});
  final int color;

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  List<Color> colors = const [
    Color(0xFFFF6B6B), // Red-pink
    Color(0xFFFFC300), // Vivid yellow
    Color(0xFF6BCB77), // Mint green
    Color(0xFF4D96FF), // Bright blue
    Color(0xFF9D4EDD), // Purple
    Color(0xFFFF6F91), // Soft pink
    Color(0xFF00C9A7), // Teal
    Color(0xFFFF9F1C), // Orange
    Color(0xFF3FA796), // Sea green
    Color(0xFFB983FF), // Light purple
  ];
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    currentIndex = colors.indexOf(Color(widget.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
              BlocProvider.of<NotesCubit>(context).color = colors[index];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ColorItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
