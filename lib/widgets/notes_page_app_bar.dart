import 'package:flutter/material.dart';
import 'package:notti/widgets/app_bar_icon.dart';
import 'package:notti/widgets/connect_with_me.dart';

class CustomNotesPageAppBar extends StatelessWidget {
  const CustomNotesPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Nawetly",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        Row(
          children: [
            AppBarIcon(
              icon: Icons.info_outline,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text(
                        'About Me',
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sofian Emad Mohamed\n'
                            'Faculty of Computers & Information, Zagazig University\n'
                            '2nd year\n'
                            'C++, Dart, Flutter, OOP, DS ,Mobile Apps',
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Connect with me:',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          ConnectWithMe(
                            link: "https://x.com/Bojjaan_Krikc",
                            name: "X",
                          ),
                          SizedBox(height: 8),
                          ConnectWithMe(
                            link: "https://www.instagram.com/sofiaan_44/",
                            name: "Instagram",
                          ),
                          SizedBox(height: 8),
                          ConnectWithMe(
                            link:
                                "https://open.spotify.com/user/31hj2cfv26knf6mj4af7beecxkru",
                            name: "Spotify",
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Close',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
