import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/auth/login/view/login_view.dart';
import 'package:tutorial_app/feature/profile/view/profile_view.dart';

class AuthSplashView extends StatelessWidget {
  const AuthSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return const ProfileView();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return const LoginView();
      },
    );
  }
}
