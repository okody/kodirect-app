import 'package:flutter/material.dart';
import 'package:kodirect/UI/Constant.dart';

class ScriptScreen extends StatelessWidget {
  const ScriptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("المساعدة",
              style: TextStyle(fontFamily: "STC", fontSize: 20))),
      body: Container(
        alignment: Alignment.topRight,
        padding: EdgeInsets.symmetric(
            horizontal: kMainPadding, vertical: kMainPadding),
        child: SingleChildScrollView(
            child: Column(
          children: [
            RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: "STC",
                      color: Colors.black,
                      height: 1,
                    ),
                    children: [
                      TextSpan(
                          text: "المساعدة\n",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "تصفح اسفل اذا تحتاج المساعدة",
                          style: TextStyle(
                            color: Colors.grey,
                          ))
                    ])),
          ],
        )),
      ),
    );
  }
}
