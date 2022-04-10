import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Providers/Screens/NotificationScreen.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar(
      {Key? key,
      this.height = 120.0,
      required this.menuClikced,
      this.backgroundImage = ""})
      : super(key: key);
  final double height;
  final ValueChanged<bool> menuClikced;
  final String backgroundImage;
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ================== > The Holder Container =========================
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: widget.height,
      curve: Curves.easeInOutExpo,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          vertical: kMainPadding / 2, horizontal: kMainPadding / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45)),
          gradient: LinearGradient(
              colors: kAlphaGridentColors,
              end: Alignment.bottomRight,
              begin: Alignment.topLeft),
          boxShadow: kgetAlphaBoxShadow()),
      child:
          // A The Column of the holder Container
          Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 45,
                ),
                onPressed: () {
                  widget.menuClikced(true);
                },
              ),

              // =====> Row of
              Container(
                padding: EdgeInsets.all(kMainPadding / 3),
                margin: EdgeInsets.symmetric(horizontal: kMainPadding/2),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: kAlphaColor),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificaitonScreen()),
                      );
                    },
                    child: Icon(
                      Icons.notifications,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Logo
          Image.asset(
            "assets/Images/App_logo.png",
            width: 50,
          ),
        ],
      ),
    );
  }
}
