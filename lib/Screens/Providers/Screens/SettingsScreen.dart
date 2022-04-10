import 'package:flutter/material.dart';
import 'package:kodirect/UI/Constant.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var languages = [
    "English",
    "العربية",
  ];
  var currentLanguage;
  @override
  void initState() {
    // TODO: implement initState
    currentLanguage = languages[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "الإعدادات",
          style: TextStyle(
              fontFamily: "STC", fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: kMainPadding / 2, horizontal: kMainPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // for (int i = 0; i < 20; i++)
                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: kMainPadding / 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kOmgaColor),
                        borderRadius: BorderRadius.circular(30),
                        // boxShadow: kgetAlphaBoxShadow(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Langague",
                            style: TextStyle(
                                fontFamily: "STC",
                                fontSize: 25,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: kMainPadding / 4),
                            // height: 20,
                            width: 2,
                            color: kOmgaColor,
                          ),
                          DropdownButton(
                            value: currentLanguage,
                            onChanged: (newLang) {
                              setState(() {
                                currentLanguage = newLang;
                              });
                            },
                            style: TextStyle(
                              fontFamily: "STC",
                              color: Colors.grey[700],
                              fontSize: 20,
                            ),
                            icon: Icon(Icons.arrow_drop_down),
                            
                            items: languages.map((String lang) {
                              return DropdownMenuItem(
                                
                                value: lang,
                                child: Text(
                                  lang,
                                  style: TextStyle(
                                    fontFamily: "STC",
                                    color: Colors.grey[700],
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "v3.15.7",
              style: TextStyle(
                  fontFamily: "STC",
                  fontSize: 17.5,
                  color: kOmgaColor.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
