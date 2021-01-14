import 'package:flutter/material.dart';
import 'package:rush_delivery/widgets/app_drawer.dart';


class HelpCenter extends StatelessWidget {
  static const routeName = '/help-center';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Center"),
      ),
      drawer: AppDrawer(),
      
    );
  }
}