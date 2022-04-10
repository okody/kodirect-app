import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kodirect/UI/Constant.dart';

class MyProfileSwitcher extends StatefulWidget {
  const MyProfileSwitcher(
      {Key? key, required this.options, required this.onChange})
      : super(key: key);
  final List<Map> options;
  final ValueChanged<Map> onChange;
  @override
  State<MyProfileSwitcher> createState() => _MyProfileSwitcherState();
}

class _MyProfileSwitcherState extends State<MyProfileSwitcher> {
  var selectedPage;

  @override
  void initState() {
    selectedPage = widget.options[0];
    // widget.onChange(selectedPage);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: kAlphaGridentColors)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.options.map((option) {
                TextStyle style;
                if (option["index"] == selectedPage["index"])
                  style = TextStyle(
                      fontFamily: "STC", fontSize: 20, color: Colors.white);
                else
                  style = TextStyle(
                      fontFamily: "STC", fontSize: 15, color: Colors.grey[400]);
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPage = option;
                        widget.onChange(selectedPage);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        option["Label"],
                        style: style,
                      ),
                    ),
                  ),
                );
              }).toList()),
        ),
        Expanded(child: selectedPage["Widget"])
      ],
    );
  }
}
