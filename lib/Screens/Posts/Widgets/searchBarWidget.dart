import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kodirect/UI/Constant.dart';

searchBar() {
  bool search = false;
  return StatefulBuilder(builder: (context, setState) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: kMainPadding / 2, horizontal: kMainPadding * 1.5),
      child: TextField(
        onTap: () {
          setState(() {
            search = true;
          });
        },
        onSubmitted: (nothing) {
            setState(() {
            search = false;
          });
        },
        // textAlign: TextAlign.right,
        style: TextStyle(color: Colors.black, fontFamily: "STC", fontSize: 15),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: kMainPadding / 3, horizontal: kMainPadding),
            icon: !search
                ? SizedBox.shrink()
                : Icon(
                    FontAwesomeIcons.search,
                    color: kTextFieldColor.withOpacity(0.5),
                  ),
            hintText: "Search ",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  });
}
