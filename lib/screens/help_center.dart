import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            Text("Since 2020 we make people happy with\n our Service.",
            style: TextStyle(
              color: kSecondaryTextColor,
              fontSize: 18
            ),),
            SizedBox(height:18),
            Text("Information:",
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 18
            ),
            ),
             SizedBox(height:18),
            Row(
              children:[
               FaIcon(FontAwesomeIcons.home,
               color: Colors.blue,
               size:20.0, 
               ),
               SizedBox(width:20),
               Text("www.rushdelivery.com",
                ),
              ],
            ),
            SizedBox(height:15),
            Row(
              children:[
               FaIcon(FontAwesomeIcons.phone,
               color: Colors.blue,
               size:20.0, 
               ),
               SizedBox(width:20),
               Text("114-456-789",
                ),
              ]
            ),
            SizedBox(height:15),
            Row(
              children:[
               FaIcon(FontAwesomeIcons.envelope,
               color: Colors.blue,
               size:20.0, 
               ),
               SizedBox(width:20),
               Text("rushdelivery@gmail.com",
                ),
              ]
            ),
            SizedBox(height:15),
            Text("Social Media:",
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 18),
          ),
           SizedBox(height:15),
             SizedBox(height:15),
            Row(
              children:[
               FaIcon(FontAwesomeIcons.facebook,
               color: Colors.blue,
               size:20.0, 
               ),
               SizedBox(width:20),
               Text("facebook/RushDeliveryApp",
                ),
              ]
            ),
             SizedBox(height:15),
            Row(
              children:[
               FaIcon(FontAwesomeIcons.instagram,
               color: Colors.blue,
               size:20.0, 
               ),
               SizedBox(width:20),
               Text("Instagram/RushDeliveryApp",
                ),
              ]
            ),

          ],
        ),
      ),
        
      
    );
  }
}