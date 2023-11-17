import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatefulWidget {
  const SocialButton({Key? key}) : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.all(32.0),
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
          child: Center(
            child: Text(
              'Continue',
              style: GoogleFonts.figtree(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
