import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/shared/app_images.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((_) => Navigator.of(context).pushReplacementNamed('/loginPage'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF80F78), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo3, 
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 35.0),
              child: Text(
                'Better done than perfect',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
                        const CircularProgressIndicator(
              color: Color(0xFFF2F2F2),
            ),
          ],
        ),
      ),
    );
  }
}


