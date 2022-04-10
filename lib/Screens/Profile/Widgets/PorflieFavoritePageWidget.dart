import 'package:flutter/material.dart';
import 'package:kodirect/UI/Constant.dart';

profileFavoritePageWidget() {
  return GridView.count(
    primary: false,
    padding:
        EdgeInsets.symmetric(horizontal: kMainPadding, vertical: kMainPadding),
    crossAxisSpacing: kMainPadding / 2,
    mainAxisSpacing: kMainPadding / 2,
    crossAxisCount: 3,
    children: [
      for (int i = 0; i <= 15; i++)
        Container(
          // width: 150,
          // height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kOmgaColor.withOpacity(0.2)),
        )
    ],
  );
}
