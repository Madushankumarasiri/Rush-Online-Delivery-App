import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// const kPrimaryColor = Color(0xFF64A1FF);
const kPrimaryColor = Color(0xFFFFCA21);
// const kPrimaryColor = Colors.yellow;
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kSecondaryTextColor = Color(0xFF757575);
// const kTextColor = Color(0xFF757575);
const kTextColor = Colors.black;
const kAnimationDuration = Duration(milliseconds: 200);

//progress Indicator
const kProgressIndicatorPulse = SpinKitPulse(
  color: kPrimaryColor,
  size: 200,
);
const kProgressWave =
    SpinKitWave(color: kPrimaryColor, type: SpinKitWaveType.center);
const kProgressThreeBounce = SpinKitThreeBounce(color: kPrimaryColor);
