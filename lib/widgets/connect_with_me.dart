import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectWithMe extends StatefulWidget {
  const ConnectWithMe({super.key, required this.link, required this.name});
  final String link;
  final String name;
  @override
  State<ConnectWithMe> createState() => _ConnectWithMeState();
}

class _ConnectWithMeState extends State<ConnectWithMe> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.link, color: Colors.blue),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () async {
            log("message");
            final url = Uri.parse(widget.link);
            try {
              log("sofiiii");
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } catch (e) {
              log(e.toString());
              // Optionally show error
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
            }
          },
          child: Text(
            widget.name,
            style: TextStyle(
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
