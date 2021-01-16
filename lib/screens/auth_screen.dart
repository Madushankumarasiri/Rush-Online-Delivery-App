import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
// import 'package:flutter_complete_guide/widgets/auth_card.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(),
                    )
                  ],
                ))));
  }
}
