import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text2/states/Successfullpage.dart';

class Successfullpage extends StatelessWidget {
static const routeName = '/successful-screen';
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(" Successfull page", style: TextStyle(
                      fontFamily: "Times New Roman",
                      color: Color(0xFF64A1FF),
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),),
                    SizedBox(child: Image.asset("assets/suc.png"),height: 500,width: 500,),
                    Text(" Your order is Successfully placed", style: TextStyle(
                      fontFamily: "Times New Roman",
                      color: Color(0xFF64A1FF),
                      fontWeight: FontWeight.bold,
                      fontSize: 19.5,
                    ),),

                    SizedBox(height: 80,),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF64A1FF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Successfullpage(),
                              ));
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
        )
    );
  }
}
