import 'package:flutter/material.dart';
import 'package:movies_app/config/constants/environment.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.movieDbKey ?? 'NO EXISTE API KEY'),
      ),
    );
  }
}
