import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virus_scanner/features/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashService splashService = SplashService();

  @override
  void initState() {
    super.initState();
    splashService.navigateToNextScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/safe-vitals-logo.svg',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Safe Vitals',
              style: TextStyle(fontSize: 24, fontFamily: 'Poppins'),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashService {
  void navigateToNextScreen(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const HomeScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    });
  }
}
