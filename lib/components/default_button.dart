import 'package:flutter/material.dart';

// import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
       child:FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xFF64A1FF),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}
// Container buildContainerGradient() {
//     return Container(
      
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         gradient: LinearGradient(
//           colors: [Color(0xFF64A1FF), Color(0xFF88FCFE)],
//           begin:FractionalOffset(0.0,0.0),
//           end: FractionalOffset(0.5,0.0),
//           stops: [0.0,1.0],
//            ),
//          ),