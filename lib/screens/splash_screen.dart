import 'package:flutter/material.dart';
import '../constants.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
          body: Center(
        child: kProgressIndicatorPulse
      ),),
    );
  }
}
