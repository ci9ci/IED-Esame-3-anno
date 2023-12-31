import 'package:appterzoanno/src/core/constants.dart';
import 'package:appterzoanno/src/presentation/auth/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthConnector extends StatefulWidget {
  const AuthConnector({super.key});

  @override
  State<AuthConnector> createState() => _AuthConnectorState();
}

class _AuthConnectorState extends State<AuthConnector> {
  @override
  void initState() {
    ifUserExist(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ColoredBox(
              color: const Color.fromRGBO(80, 124, 171, 1).withOpacity(0.1),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'images/background_image.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.9),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Testo
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Apul.ia',
                          style: GoogleFonts.figtree(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: const Color.fromRGBO(194, 232, 255, 1),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Oltre ciò che vedi',
                              style: GoogleFonts.figtree(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Scopri e valorizza il patrimonio pugliese.',
                              style: GoogleFonts.figtree(
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox.shrink(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.figtree(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SocialButton(),
                  ],
                ),
                const Column(
                  children: [
                    Text('IED exam'),
                    Text('Privacy Policy'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
