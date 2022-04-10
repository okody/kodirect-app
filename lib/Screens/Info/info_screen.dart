import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Providers/Widgets/MyAppBar.dart';
import 'package:kodirect/Screens/Providers/Widgets/my_drawer.dart';
import 'package:kodirect/UI/Constant.dart';

import 'Widgets/cards.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer_Slide(main_Mneu: MainMenu),
      body: Builder(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 120),
                child: CarouselSlider(
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height,
                        autoPlay: true,
                        viewportFraction: 1),
                    items: [Card1(context), Card2(context)]),
              ),
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
