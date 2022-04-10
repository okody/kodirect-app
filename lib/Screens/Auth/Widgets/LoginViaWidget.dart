  import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kodirect/UI/Constant.dart';

Container LoginViaWidget() {
    return Container(
          child: Column(
            children: [
              Text(
                "Login via",
                style: TextStyle(
                    fontSize: 16, color: kOmgaColor, fontFamily: "STC"),
              ),
              SizedBox(height: kMainPadding / 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.facebook,
                    size: 25,
                    color: kOmgaColor,
                  ),
                  SizedBox(width: kMainPadding),
                  Icon(
                    FontAwesomeIcons.google,
                    size: 25,
                    color: kOmgaColor,
                  ),
                  SizedBox(width: kMainPadding),
                  Icon(
                    FontAwesomeIcons.twitter,
                    size: 25,
                    color: kOmgaColor,
                  ),
                ],
              )
            ],
          ),
        );
  }
