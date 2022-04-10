import 'package:flutter/material.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Providers/Widgets/MyAppBar.dart';
import 'package:kodirect/Screens/Providers/Widgets/my_drawer.dart';
import 'package:kodirect/UI/Constant.dart';
import 'Widgets/MainSendPartWidget.dart';

class SendScreen extends StatefulWidget {
  SendScreen({Key? key}) : super(key: key);

  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  TextEditingController message = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer_Slide(main_Mneu: MainMenu),
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (context) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 120),
              child: mainSendPartWidget(),
            ),
            MyAppBar(
              menuClikced: (drawerStatus) {
                setState(() {
                  Scaffold.of(context).openEndDrawer();
                });
              },
            )
          ],
        );
      }),
    );
  }
}
