import 'package:flutter/material.dart';
import 'package:to_do_list/pages/home_page.dart';
import 'package:to_do_list/pages/login_page.dart';
import 'package:to_do_list/pages/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskBok',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/splashPage',
      routes: {
        '/splashPage': (context) => const SplashScreenPage(),
        '/loginPage': (context) => const LoginPage(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}
