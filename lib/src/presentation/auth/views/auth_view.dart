import 'package:appterzoanno/src/presentation/auth/widgets/social_button.dart';
import 'package:flutter/material.dart';

class AuthConnector extends StatelessWidget {
  const AuthConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: ColoredBox(
              color: const Color.fromRGBO(80, 124, 171, 1).withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Apul.ia',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(5, 38, 89, 1)),
                    ),
                    Text('Oltre ciò che vedi'),
                    SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox.shrink(),
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SocialButton(),
                    ],
                  ),
                  Column(
                    children: const [Text('IED exam'), Text('Privacy Policy')],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
