import 'package:bloc_login_demo/features/auth/presentation/screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToLoginScreen();
  }

  goToLoginScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: FlutterLogo(
        size: 80,
      )),
    );
  }
}
