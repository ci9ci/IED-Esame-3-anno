import 'package:flutter/material.dart';

class SocialButton extends StatefulWidget {
  const SocialButton({super.key});

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  var isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: 56,
        decoration: BoxDecoration(
          color: isHovered
              ? const Color.fromRGBO(80, 124, 171, 1)
              : const Color.fromRGBO(5, 38, 89, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Continue',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
