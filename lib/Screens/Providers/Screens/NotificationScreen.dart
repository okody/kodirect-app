import 'package:flutter/material.dart';
import 'package:kodirect/UI/Constant.dart';

class NotificaitonScreen extends StatefulWidget {
  const NotificaitonScreen({Key? key}) : super(key: key);

  @override
  State<NotificaitonScreen> createState() => _NotificaitonScreenState();
}

class _NotificaitonScreenState extends State<NotificaitonScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.notifications),
          centerTitle: true,
          title: Text(
            "Notifications",
            style: TextStyle(fontFamily: "STC"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i <= 5; i++)
                Container(
                  // height: 125,
                  margin: EdgeInsets.symmetric(
                      horizontal: kMainPadding, vertical: kMainPadding / 2),
                  padding: EdgeInsets.all(kMainPadding / 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: kAlphaColor),
                      // boxShadow: kgetAlphaBoxShadow(),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   width: kMainPadding,
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                size: 50,
                                color: kAlphaColor,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kMainPadding / 2,
                                    horizontal: kMainPadding / 2),
                                width: 2,
                                height: 40,
                                color: Colors.grey[300],
                              ),
                              Text(
                                "Welcome",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "STC",
                                    fontSize: 20,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "15/10/21 15:33",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "STC",
                                    fontSize: 12.5,
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: kMainPadding / 4),
                              Icon(
                                Icons.timer,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                        ],
                      ),

                      InkWell(
                        child: Container(
                          // alignment: Alignment.topRight,
                          margin: EdgeInsets.symmetric(
                              vertical: kMainPadding / 2,
                              horizontal: kMainPadding / 2),
                          child: Text(
                            " How are you doing " * 10,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "STC",
                                fontSize: 13,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
