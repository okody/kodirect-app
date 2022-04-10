import 'package:flutter/material.dart';

// // ==> Colors
const Color kAlphaColor = Color(0xFF00ac9f);
const Color kBetaColor = Color(0xFFeeeeee);
const Color kBackgroundColor = Color(0xFFeef5ff);
const Color kGamaColor = Color(0xFFd1d1d1);
const Color kXrayColor = Color(0xFF00ac9f);
const Color kOmgaColor = Color(0xFF2a8eff);
const Color kTextFieldColor = Color(0xFF707070);

// const Hieghts
double kHeightAppbar(context) => MediaQuery.of(context).size.height * 0.15;
double kHeightAppbarLogo(context) => MediaQuery.of(context).size.height / 10;

// Length of textFIled
const int kMessageFieldLength = 1024;
const int kinfoFieldLength = 5;

// boxShadow
List<BoxShadow> kgetAlphaBoxShadow({Color color = kAlphaColor}) => [
      BoxShadow(
        color: color.withOpacity(0.3),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ];
// // ==> Gredient Color;
List<Color> kAlphaGridentColors = [kXrayColor, kOmgaColor];
List<Color> kAlphaGridentColors50 = [
  kXrayColor.withOpacity(0.5),
  kOmgaColor.withOpacity(0.5)
];
// List<Color> kBetaGridentColors = [];

// // ==> Main Padding
double kMainPadding = 20.0;
