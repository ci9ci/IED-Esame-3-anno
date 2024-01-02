import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(top: 12),
            color: const Color.fromARGB(155, 149, 149, 149),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      color: Colors.white,
                    ),
                  ],
                ),
                // Inserisci qui il Container con il simbolo '+'
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(194, 232, 255, 1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Column(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Rimuovi il Container() che è vuoto
        Expanded(child: ListView())
      ],
    );
  }
}
