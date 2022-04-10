import 'package:flutter/material.dart';
import 'package:kodirect/UI/Constant.dart';

class MySwitchButton extends StatefulWidget {
  const MySwitchButton(
      {Key? key,
      required this.option1,
      required this.option2,
      required this.color,
      required this.onChange})
      : super(key: key);

  final Map option1;
  final Map option2;
  final Color color;
  final ValueChanged<int> onChange;

  @override
  State<MySwitchButton> createState() => _MySwitchButtonState();
}

class _MySwitchButtonState extends State<MySwitchButton> {
  bool switched = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: widget.color)),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutExpo,
            width: 125,
            height: 45,
            decoration: BoxDecoration(
                color: switched ? Colors.transparent : widget.color,
                borderRadius: BorderRadius.circular(25)),
            child: InkWell(
              onTap: () {
                setState(() {
                  switched = false;
                  // selctedOption();
                  widget.onChange(1);
                });
              },
              child: Center(
                child: Text(
                  widget.option1["Label"],
                  style: TextStyle(
                      color: switched ? Colors.black : Colors.white,
                      fontFamily: "STC",
                      fontSize: 15),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 250),
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOutExpo,
              width: 125,
              height: 45,
              decoration: BoxDecoration(
                  color: switched ? widget.color : Colors.transparent,
                  borderRadius: BorderRadius.circular(25)),
              child: InkWell(
                onTap: () {
                  setState(() {
                    switched = true;
                    widget.onChange(2);
                  });
                },
                child: Center(
                  child: Text(
                    widget.option2["Label"],
                    style: TextStyle(
                        color: switched ? Colors.white : Colors.black,
                        fontFamily: "STC",
                        fontSize: 15),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
