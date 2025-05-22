import 'package:flutter/material.dart';
import 'package:notti/constants.dart';
import 'package:notti/models/note_model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textDirection:
                  Helper().isArabic(note.title)
                      ? TextDirection.rtl
                      : TextDirection.ltr,
              style: TextStyle(
                fontFamily:
                    Helper().isArabic(note.title)
                        ? "Playpen Sans Arabic"
                        : "Acme",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              note.content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textDirection:
                  Helper().isArabic(note.content)
                      ? TextDirection.rtl
                      : TextDirection.ltr,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.92),
                fontWeight: FontWeight.w400,
                height: 1.4,
                fontFamily:
                    Helper().isArabic(note.title)
                        ? "Playpen Sans Arabic"
                        : "Acme",
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
            ),
            if (note.voiceNotePath != null && note.voiceNotePath!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.mic,
                      color: Colors.white.withOpacity(0.7),
                      size: 20,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Voice Note',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.redAccent, size: 22),
                  onPressed: onDelete,
                  tooltip: 'Delete Note',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
