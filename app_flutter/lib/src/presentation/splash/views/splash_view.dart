import 'package:appterzoanno/src/core/constants.dart';
import 'package:appterzoanno/src/presentation/auth/views/auth_view.dart';
import 'package:appterzoanno/src/presentation/home/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashConnector extends StatefulWidget {
  const SplashConnector({super.key});

  @override
  State<SplashConnector> createState() => _SplashConnectorState();
}

class _SplashConnectorState extends State<SplashConnector> {
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  void checkUser() async {
    await Future.delayed(const Duration(seconds: 1));
    if (user != null) {
      goTo(context, const HomeConnector());
    } else {
      goTo(context, const AuthConnector());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'images/sfondo.jpg',
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
            // Centered Image
            Image.asset(
              'images/logo.png',
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }
}
