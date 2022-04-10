import 'package:flutter/material.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Providers/Widgets/MyAppBar.dart';
import 'package:kodirect/Screens/Providers/Widgets/my_drawer.dart';
import 'Widgets/MainMessagePartWidget.dart';

class DirectScreen extends StatefulWidget {
  DirectScreen({Key? key}) : super(key: key);

  @override
  _DirectScreenState createState() => _DirectScreenState();
}

class _DirectScreenState extends State<DirectScreen> {
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: kBackgroundColor,

      endDrawer: new Drawer_Slide(main_Mneu: MainMenu),
      body: Builder(builder: (context) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            alignment: Alignment.center,
            image: AssetImage("assets/Images/Direct_bg.png"),
          )),
          child: Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 120),
              child: mainMessagePartWidget(),
            ),
            MyAppBar(
              menuClikced: (drawerStatus) {
                setState(() {
                  Scaffold.of(context).openEndDrawer();
                });
              },
            )
          ]),
        );
      }),
    );
  }
}
