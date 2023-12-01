import 'package:appterzoanno/src/core/constants.dart';
import 'package:flutter/material.dart';

class HomeConnector extends StatefulWidget {
  const HomeConnector({super.key});

  @override
  State<HomeConnector> createState() => _HomeConnectorState();
}

class _HomeConnectorState extends State<HomeConnector> {
  @override
  void initState() {
    ifUserDoesntExist(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user?.userMetadata?['email']),
      ),
    );
  }
}
