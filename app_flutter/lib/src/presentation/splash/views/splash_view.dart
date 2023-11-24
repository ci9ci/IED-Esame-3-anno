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
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
