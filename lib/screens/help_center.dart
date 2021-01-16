import 'package:flutter/material.dart';
import 'package:rush_delivery/constants.dart';
import 'package:rush_delivery/widgets/app_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpCenter extends StatelessWidget {
  static const routeName = '/help-center';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Center"),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 400,
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://static.vecteezy.com/system/resources/previews/000/555/593/original/female-customer-service-vector.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 5),

              Text(
                "Rush Food Delivery App",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontSize: 24),
              ),
              Text(
                "Since 2020 we make people happy with\n our Service.",
                style: TextStyle(color: kSecondaryTextColor, fontSize: 16),
              ),
              SizedBox(height: 18),
              Text(
                "Information:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 18),
              Row(children: [
                FaIcon(
                  FontAwesomeIcons.home,
                  color: kPrimaryColor,
                  size: 20.0,
                ),
                SizedBox(width: 20),
                Text(
                  "www.rushdelivery.com",
                ),
              ]),
              SizedBox(height: 15),
              Row(children: [
                FaIcon(
                  FontAwesomeIcons.phone,
                  color: kPrimaryColor,
                  size: 20.0,
                ),
                SizedBox(width: 20),
                Text(
                  "114-456-789",
                ),
              ]),
              SizedBox(height: 15),
              Row(children: [
                FaIcon(
                  FontAwesomeIcons.envelope,
                  color: kPrimaryColor,
                  size: 20.0,
                ),
                SizedBox(width: 20),
                Text(
                  "rushdelivery@gmail.com",
                ),
              ]),
              SizedBox(height: 15),
              Text(
                "Social Media:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              SizedBox(height: 15),
              SizedBox(height: 15),
              Row(children: [
                FaIcon(
                  FontAwesomeIcons.facebook,
                  color: kPrimaryColor,
                  size: 20.0,
                ),
                SizedBox(width: 20),
                Text(
                  "facebook/RushDeliveryApp",
                ),
              ]),
              SizedBox(height: 15),
              Row(children: [
                FaIcon(
                  FontAwesomeIcons.instagram,
                  color: kPrimaryColor,
                  size: 20.0,
                ),
                SizedBox(width: 20),
                Text(
                  "Instagram/RushDeliveryApp",
                ),
              ]),
              SizedBox(height: 15),
              Row(children: [
                FaIcon(
                  FontAwesomeIcons.youtube,
                  color: kPrimaryColor,
                  size: 20.0,
                ),
                SizedBox(width: 20),
                Text(
                  "Youtube/RushDeliveryApp",
                ),
              ]),
              SizedBox(height: 20),

              // Text("Who we are?",
              // textAlign: TextAlign.left,
              // style:TextStyle(color: Colors.black,
              // fontSize: 30,
              // fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
