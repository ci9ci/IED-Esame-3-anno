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
              color: Colors.deepPurple.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Logo'),
                    Text('Description'),
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
                      Text('Get Started'),
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
