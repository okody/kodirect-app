import 'package:flutter/material.dart';
import 'package:kodirect/Screens/Providers/Functions/Alert_Dilog.dart';
import 'package:kodirect/UI/Constant.dart';

alert(context, AlertInfo_DATA alertInfo) {
  List<MyAction> myactions = alertInfo.actions;

  showDialog(
      context: context,
      barrierDismissible: alertInfo.canGetBack,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            // shape: ShapeBorder.lerp(ShapeBorder, b, t),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(alertInfo.content.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: "STC",
                            fontSize: 20,
                            color: Colors.grey)),
                  ],
                ),
              ),
            ),

            title: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.centerRight,
              children: [
                !alertInfo.canGetBack
                    ? SizedBox.shrink()
                    : Positioned(
                        left: 0,
                        top: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(kMainPadding / 8),
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.5),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        )),
                Positioned(
                    top: kMainPadding * -3.65,
                    right: kMainPadding * 0.75,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kMainPadding),
                      decoration: BoxDecoration(
                          boxShadow: kgetAlphaBoxShadow(),
                          shape: BoxShape.circle,
                          color: Colors.white),
                      child: alertInfo.icon != null
                          ? Icon(
                              alertInfo.icon,
                              size: 50,
                              color: kAlphaColor,
                            )
                          : Image.asset(
                              "assets/Images/App_logo.png",
                              color: kAlphaColor,
                            ),
                    )),
                alertInfo.title.toString().isEmpty
                    ? SizedBox.shrink()
                    : Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: kMainPadding * 1.5),
                        child: Text(alertInfo.title.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(fontFamily: "STC", fontSize: 25)),
                      ),
              ],
            ),

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            actions: myactions.map((action) {
              return InkWell(
                  onTap: () {
                    action.action();
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: kMainPadding / 4, vertical: kMainPadding),
                      padding: EdgeInsets.symmetric(
                          horizontal: kMainPadding * 2,
                          vertical: kMainPadding / 4),
                      decoration: BoxDecoration(
                          color: kAlphaColor,
                          border: Border.all(color: kAlphaColor),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Text(
                        action.title.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(fontFamily: "STC", fontSize: 15),
                      )));
            }).toList(),
          );
        });
      });
}
