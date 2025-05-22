import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notti/pages/add_note_page.dart';
import 'package:notti/widgets/notes_page_app_bar.dart';

class NoNotesYet extends StatelessWidget {
  const NoNotesYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNotePage()),
          );
        },
        child: Column(
          children: [
            CustomNotesPageAppBar(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/imgs/no_notes.json"),
                SizedBox(height: 20),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Create your first Note !",
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddNotePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
