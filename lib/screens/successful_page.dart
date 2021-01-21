import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/app_drawer.dart';
import 'orders_screen.dart';


class Successfullpage extends StatelessWidget {
static const routeName = '/successful-screen';
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      drawer: AppDrawer(),
          body: Container(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Column(
                  children: <Widget>[
                   
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:NetworkImage(
                            'https://lh3.googleusercontent.com/proxy/9HyK0Gd2p6BY6pIcMegUBy2DjMr6tWH5u1xZ4brJqXxqtaYt8IozNwHE4FRIJBpweSqn0XSFzg7SDOdBSakcSlJaisxPJTg'), ),
                      ),
                    height: 300,width: 500,),
                     SizedBox(height: 20,),
                    Text(" Your order is Successfully placed.", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Times New Roman",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19.5,
                    ),),

                    SizedBox(height: 80,),
                    Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                 
                        },
                        height: 10,
                        minWidth: MediaQuery.of(context).size.width*.25,
                        child: Text("OK",style: TextStyle(
                          fontFamily: "Times New Roman",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                      ),
                    )
                  ],
                ),
              )
          ),
        );
   
  }
}
