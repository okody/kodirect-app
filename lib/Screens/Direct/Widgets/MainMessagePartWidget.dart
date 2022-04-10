import 'package:clipboard/clipboard.dart';
import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/Services/API/Services/user_services.dart';
import 'package:kodirect/UI/Constant.dart';

mainMessagePartWidget() {
  bool textOn = false;
  TextEditingController message = TextEditingController(text: "");
  TextEditingController phone = TextEditingController(text: "");
  String phoneCode = "966";

  return StatefulBuilder(builder: (context, setState) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          textOn = false;
        });
        return false;
      },
      child: Container(
        // width: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.only(bottom: kMainPadding * 5),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: kMainPadding * 4,
              ),
              Container(
                child: Image.asset(
                  "assets/Images/Direct_il.png",
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: kMainPadding * 2,
              ),
              Column(
                children: [
                  // ====> Text part
                  Builder(builder: (context) {
                    return Container(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                fontFamily: "STC",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15),
                            children: [
                              TextSpan(
                                  text:
                                      "Send a message to your WhatsApp contact\n",
                                  style: TextStyle(fontSize: 18.5)),
                              TextSpan(
                                  text: "Paste the number directly and send",
                                  style: TextStyle(color: kAlphaColor)),
                            ]),
                      ),
                    );
                  }),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kMainPadding * 1.5,
                        vertical: kMainPadding / 4),
                    child: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (selected) {
                            // countryCode = selected;
                            setState(() {
                              phoneCode = selected.toString();
                            });
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'SA',
                          favorite: ["SA", 'US'],
                          // optional. Shows only country name and flag
                          showCountryOnly: true,

                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ),
                        Expanded(
                            child: Container(
                                child: TextField(
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: "STC", fontSize: 20),
                          keyboardType: TextInputType.phone,
                          controller: phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(15),
                          ],
                          onTap: () {
                            FlutterClipboard.paste().then((value) {
                              // Do what ever you want with the value.
                              value.replaceAll(" ", "");

                              setState(() {
                                if (value.length < 15) phone.text = value;
                              });
                            });
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: kMainPadding,
                              ),
                              hintText: "551....",
                              hintStyle:
                                  TextStyle(fontFamily: "STC", fontSize: 12.5),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        )))
                      ],
                    ),
                  ),

                  // SizedBox(height: kMainPadding),
                  // =====>
                  Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: [
                      // Bottom Container
                      Positioned(
                        bottom: kMainPadding * -3.5,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: kMainPadding / 2),
                          height: 125,
                          decoration: BoxDecoration(
                              color: kBetaColor,
                              borderRadius: BorderRadius.circular(45),
                              border: Border.all(color: kGamaColor)),
                        ),
                      ),

                      // === Text Filed Container
                      Container(
                        // width: 350,
                        // height: 125,
                        // constraints: BoxConstraints(minHeight: 150.0),
                        margin: EdgeInsets.symmetric(
                            horizontal: kMainPadding * 1.5,
                            vertical: kMainPadding / 2),

                        // padding: EdgeInsets.symmetric(
                        //     horizontal: kMainPadding,
                        //     vertical: kMainPadding / 2),

                        decoration: BoxDecoration(
                            boxShadow: kgetAlphaBoxShadow(),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: kGamaColor)),
                        child: TextField(
                          onTap: () {
                            setState(() {
                              textOn = true;
                            });
                          },

                          controller: message,
                          // textAlign: TextAlign.right,
                          maxLines: null,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(250),
                          ],
                          // maxLength: kMessageFieldLength,
                          style: TextStyle(fontFamily: "STC", fontSize: 15),
                          decoration: InputDecoration(
                            hintText: "Type your message",
                            hintStyle:
                                TextStyle(fontFamily: "STC", fontSize: 12.5),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: kMainPadding,
                                vertical: kMainPadding),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onHover: (test) {
                      print("test");
                    },
                    onTap: () async {
                      User_SERVICES user_services = User_SERVICES();
                      Response_Model response_Model =
                          await user_services.get_User("dafawefaef3wfawfdsf");

                   

                      //     print(response_Model.data);

                      // if (phone.text.isEmpty) {
                      //   alert(
                      //       context,
                      //       AlertInfo_MODEL(
                      //           actions: [

                      //           ],
                      //           title: "Alert",
                      //           icon: Icons.dangerous,
                      //           content:
                      //               "Please enter a phone number"));
                      //   return;
                      // }

                      // launch(
                      //     'https://wa.me/${phoneCode}${phone.text}?text=${message.text}');
                    },
                    child: Container(
                      // alignment: Alignment.center,
                      width: kMainPadding * 5,
                      height: kMainPadding * 5,
                      decoration: BoxDecoration(
                          boxShadow: kgetAlphaBoxShadow(),
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: kGamaColor)),
                      child: Icon(
                        FontAwesomeIcons.telegram,
                        size: 50,
                        color: kAlphaColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  });
}
