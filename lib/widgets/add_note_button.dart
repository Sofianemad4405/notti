import 'package:flutter/material.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            offset: Offset(-5, 0),
            blurRadius: 3,
            spreadRadius: 0.5,
          ),
        ],
        borderRadius: BorderRadius.circular(40),
      ),
      child: FloatingActionButton(
        backgroundColor: Color(0xffE3A100),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        onPressed: onPressed,
        elevation: 0,
        child: Icon(Icons.add, color: Colors.white, size: 48),
      ),
    );
  }
}
