import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.home_rounded,
            color: Colors.white,
          ),
          const Icon(
            Icons.pin_drop,
            color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(194, 232, 255, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(13),
            child: const Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.chat_bubble_outline_rounded,
            color: Colors.white,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                'URL_dell_immagine',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
