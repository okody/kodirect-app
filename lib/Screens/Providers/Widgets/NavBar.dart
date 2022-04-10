import 'package:flutter/material.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/UI/Constant.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
    required this.screens,
    required this.onTap,
    // required  selected_Screen,
  }) : super(key: key);

  final List<Screen_MODEL> screens;
  final ValueChanged<Screen_MODEL> onTap;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _selected_Screen;
  var onTap;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selected_Screen = widget.screens[2];
    // onTap  = widget.onTap(_selected_Screen["index"]);
  }

  bool selected_Animated = false;

  chossed() async {
    setState(() {
      selected_Animated = false;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        selected_Animated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(
                vertical: kMainPadding / 3, horizontal: kMainPadding / 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kXrayColor.withOpacity(0.5),
                boxShadow: kgetAlphaBoxShadow()),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.screens.map((Screen_MODEL Screen) {
                  if (Screen.index == 2)
                    return Container(
                      width: 50,
                    );
                  else
                    return InkWell(
                      onTap: () {
                        setState(() {
                          // [1] -- asagin the previous _selcted screen at postion 2 to a new virable

                          Screen_MODEL preScreen = _selected_Screen;
                          // [2] -- the previous screen index would be replaced with the current selected one
                          preScreen.setIndex(Screen.index);
                          // [3] the current index since it has been selected its palce would be in the middle
                          Screen.setIndex(2);
                          // [4] remove the previous one after we assgin it already to a veribaly so the the postion is ready to be filled
                          widget.screens.removeAt(2);
                          // [5] with the current selcted screen assgined as shown above to the middle position insert it in the list with its 2 index
                          widget.screens.insert(Screen.index, Screen);
                          // [6] -- now the goable variable _Selected_Screen would pick the middle one as the current
                          _selected_Screen = widget.screens[2];
                          widget.screens.removeAt(preScreen.index);
                          widget.screens.insert(preScreen.index, preScreen);
                          widget.onTap(_selected_Screen);
                          chossed();
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 5),
                        curve: Curves.bounceInOut,
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Icon(
                            Screen.icon,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                }).toList()),
          ),

          // =========== Middle White Circle && secleted chosse ============
          Positioned(
            bottom: 0,
            child: Container(
              // curve: Curves.bounceInOut,
              alignment: Alignment.center,
              width: 90,
              height: 90,
              margin: EdgeInsets.symmetric(vertical: kMainPadding * 0.55),
              decoration: BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.circle),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInExpo,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: kMainPadding / 2),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: kOmgaColor),
                child: Icon(
                  _selected_Screen.icon,
                  size: selected_Animated ? 35 : 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class BackgroundClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {

//     var path = Path();

//     path.moveTo(0, size.width - 50);
//     path.lineTo(0, size.width + 50);
//     // path.quadraticBezierTo(x1, y1, x2, y2)

//       // TODO: implement getClip
//       return path;
//     }

//     @override
//     bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     throw UnimplementedError();
//   }

// }
