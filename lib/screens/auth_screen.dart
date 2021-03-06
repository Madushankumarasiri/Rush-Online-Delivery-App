import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:rush_delivery/widgets/auth_card.dart';


enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: ColorFiltered(
colorFilter: ColorFilter.mode(Colors.white12.withOpacity(.90), BlendMode.dstIn),
               child: Container(
                 decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://previews.123rf.com/images/romastudio/romastudio1603/romastudio160300203/54088672-healthy-food-background-studio-photo-of-different-fruits-and-vegetables-on-white-wooden-table-high-r.jpg'), 
                  fit: BoxFit.cover)),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                'Rush Delivery',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 35,
                                  fontFamily: 'Anton',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                  "Sign up with email and password\n or continue with social media",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: kSecondaryColor,
                                    fontSize: 16,
                                  ),
                                  maxLines: 2),
                              Container(
                                  height: deviceSize.height,
                                  width: deviceSize.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Flexible(
                                          flex: deviceSize.width > 600? 2: 1,
                                          child: AuthCard(),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                icon: FaIcon(
                                                  FontAwesomeIcons.google,
                                                  color: Colors.blue,
                                                ),
                                                onPressed: null),
                                            IconButton(
                                                icon: FaIcon(
                                                  FontAwesomeIcons.facebook,
                                                  color: Colors.blue,
                                                ),
                                                onPressed: null),
                                            IconButton(
                                                icon: FaIcon(
                                                  FontAwesomeIcons.twitter,
                                                  color: Colors.blue,
                                                ),
                                                onPressed: null),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "By continuing your confirm that you agree \nwith our Terms and Conditions",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: kSecondaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            )));
  }
}
