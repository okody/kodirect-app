import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_controller.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Splash/splash_screen.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Drawer_Slide extends StatelessWidget {
  Drawer_Slide({
    Key? key,
    required this.main_Mneu,
  }) : super(key: key);

  final List<Drawer_MODEL> main_Mneu;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        // margin: EdgeInsets.only(
        //     // top: kMainPadding * 2,
        //     // bottom: kMainPadding * 2,
        //     left: kMainPadding),
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(25), topLeft: Radius.circular(25)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: kAlphaGridentColors)),
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(
                    "assets/Images/Splash_Logo.png",
                  ),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            SizedBox(
              height: kMainPadding * 2,
            ),
            Column(
              children: main_Mneu
                  .map((option) => InkWell(
                        onTap: () {
                          if (option.page != null)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => option.page),
                            );
                          else if (option.url != null)
                            launch(option.url);
                          else if (option.function != null) option.function();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white, width: 1.5))),
                          padding: EdgeInsets.only(
                              right: kMainPadding / 2,
                              left: kMainPadding / 2,
                              bottom: kMainPadding / 4),
                          margin: EdgeInsets.only(bottom: kMainPadding),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                option.title,
                                style: TextStyle(
                                    fontFamily: "STC",
                                    fontSize: 17.5,
                                    color: Colors.white),
                              ),
                              Icon(
                                option.icon,
                                color: Colors.white,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: kMainPadding * 4,
            ),
            
             
          ],
        ),
      ),
    );
  }
}
