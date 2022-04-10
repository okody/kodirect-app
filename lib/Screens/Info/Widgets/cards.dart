import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kodirect/UI/Constant.dart';

Widget Card1(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          // margin: EdgeInsets.symmetric(vertical: kMainPadding * 2),
          child: Center(
            child: Image.asset(
              "assets/Images/Info_il1.png",
              width: 250,
            ),
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: EdgeInsets.symmetric(
            vertical: kMainPadding * 1.5, horizontal: kMainPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBetaColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), topLeft: Radius.circular(50))),
        child: Center(
          child: Column(
            children: [
              Text(
                "من نحن؟",
                style: TextStyle(
                    fontFamily: "STC",
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                height: 5,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: kMainPadding),
                  child: SingleChildScrollView(
                      child: (Text(
                    "مرحبا " * 85,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "STC", fontSize: 12.5, color: Colors.grey),
                  )))),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget Card2(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          alignment: Alignment.center,
          // margin: EdgeInsets.symmetric(vertical: kMainPadding * 2),
          child: Center(
            child: Image.asset(
              "assets/Images/Info_il2.png",
              // width: 250,
            ),
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: EdgeInsets.symmetric(
            vertical: kMainPadding * 1.5, horizontal: kMainPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBetaColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), topLeft: Radius.circular(50))),
        child: Center(
          child: Column(
            children: [
              Text(
                "تواصل معنا",
                style: TextStyle(
                    fontFamily: "STC",
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                height: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.envelope,
                                size: 40,
                                color: Colors.grey,
                              ),
                              // SizedBox(
                              //   width: kMainPadding * 1.5,
                              // ),
                              Text(
                                "Kodx@gmail.com",
                                style: TextStyle(
                                    fontFamily: "STC",
                                    fontSize: 22.5,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          SizedBox(
                            height: kMainPadding * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.phoneAlt,
                                size: 40,
                                color: Colors.grey,
                              ),
                              // SizedBox(
                              //   width: kMainPadding * 1.5,
                              // ),
                              Text(
                                "+966551028284",
                                style: TextStyle(
                                    fontFamily: "STC",
                                    fontSize: 22.5,
                                    color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.instagram,
                          color: kOmgaColor,
                          size: 50,
                        ),
                        SizedBox(width: kMainPadding * 2),
                        Icon(
                          FontAwesomeIcons.twitter,
                          color: kOmgaColor,
                          size: 50,
                        ),
                        SizedBox(width: kMainPadding * 2),
                        Icon(
                          FontAwesomeIcons.facebook,
                          color: kOmgaColor,
                          size: 50,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
