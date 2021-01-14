import 'package:flutter/material.dart';
import 'package:rush_delivery/widgets/app_drawer.dart';

import '../constants.dart';



class HelpCenter extends StatelessWidget {
  static const routeName = '/help-center';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Center"),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width:400,
              height: 200,
              decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://cdn.dribbble.com/users/77121/screenshots/10634984/media/da85bf275076874503b86b6713335c35.gif"),
                fit: BoxFit.cover),
              ),
            ),
            Text("Rush Food Delivery App",
            style: TextStyle(fontWeight: FontWeight.bold,
            color: kPrimaryColor,
            fontSize: 24),
            ),
          ],
        ),),
        
      
    );
  }
}