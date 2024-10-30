import 'package:flutter/material.dart';
import 'package:movie/login.dart';

class Splash extends StatefulWidget {
  static const String routeName = '/';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: 150,
            ),
            const SizedBox(height: 7),
            const Padding(
              padding: EdgeInsets.only(left: 27.0),
            ),
          ],
        ),
      ),
    );
  }
}
