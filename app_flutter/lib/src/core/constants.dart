import 'package:appterzoanno/src/presentation/auth/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
User? get user => supabase.auth.currentUser;

void goTo(BuildContext context, Widget destination) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => destination));
}

Future<void> ifUserDoesntExist(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 300));
  if (user == null) {
    goTo(context, const AuthConnector());
  }
}

Future<void> ifUserExist(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 300));
  if (user != null) {
    goTo(context, const AuthConnector());
  }
}
