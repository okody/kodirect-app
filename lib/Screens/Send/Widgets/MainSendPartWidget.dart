import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kodirect/UI/Constant.dart';

mainSendPartWidget() {
  TextEditingController message = TextEditingController(text: "");
  bool onText = false;
  return StatefulBuilder(builder: (context, setState) {
    return Container(
      height: MediaQuery.of(context).size.height - 120,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Images/Direct_bg.png"))),
      // margin: EdgeInsets.only(
      //     top: kMainPadding * 10, right: kMainPadding, left: kMainPadding),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: kMainPadding * 4,
            ),
            Container(
              // margin: EdgeInsets.only(bottom: kMainPadding * 20),
              child: Image.asset(
                "assets/Images/Send_il.png",
                // height: 500,
                // width: 500,
              ),
            ),
            SizedBox(
              height: kMainPadding * 2,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kMainPadding * 1.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                              style: TextStyle(
                                  fontFamily: "STC",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15),
                              children: [
                                TextSpan(
                                    text: "ارسل رسالة جماعية  واتساب \n",
                                    style: TextStyle(fontSize: 18.5)),
                                TextSpan(
                                    text: "حدد جهات الاتصال وقم بالارسال",
                                    style: TextStyle(color: Colors.green))
                                    
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: kMainPadding / 2,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            boxShadow: kgetAlphaBoxShadow(color: Colors.green)),
                        child: Image.asset("assets/Icons/WhatsappLogo.png"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: kMainPadding / 3,
                ),
                Container(
                  // width: 350,
                  // height: 100,
                  margin: EdgeInsets.symmetric(
                      vertical: kMainPadding / 2, horizontal: kMainPadding),

                  // padding: EdgeInsets.symmetric(
                  //     horizontal: kMainPadding, vertical: kMainPadding / 2),

                  decoration: BoxDecoration(
                      boxShadow: kgetAlphaBoxShadow(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: kGamaColor)),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        onText = true;
                      });
                    },
                    controller: message,
                    textAlign: TextAlign.right,
                    maxLines: null,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(250),
                    ],
                    // maxLength: kMessageFieldLength,
                    style: TextStyle(fontFamily: "STC", fontSize: 15),

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: kMainPadding , vertical: kMainPadding),
                      hintText: "......اكتب رسالتك المطلولة هنا",
                      hintStyle: TextStyle(fontSize: 12.5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                SizedBox(
                  height: kMainPadding / 2,
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      height: 43.33,
                      decoration: BoxDecoration(
                          color: kAlphaColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text(
                        "ارسل ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "STC"),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  });
}
