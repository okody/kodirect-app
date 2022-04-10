import 'package:flutter/material.dart';
import 'package:kodirect/Models/Post/comment_model.dart';
import 'package:kodirect/Screens/Posts/Functions/DateFormat.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:intl/intl.dart';
import 'package:kodirect/UI/default_profile.dart';

Widget CommentDetails(Comment_MODEL comment, BuildContext context) {
  List<String> commentList = ["Report", "Save", "Delete"];
  return Row(
    // mainAxisAlignment:
    //     // MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Proflie Pict
      Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                image: DecorationImage(
                    image: defaultProfile(
                        comment.poster!.profiePicture.toString())),
                border: Border.all(color: Colors.white)),
          ),
          Text(comment.poster!.userName.toString(),
              style: TextStyle(
                  color: Colors.white, fontFamily: "STC", fontSize: 15))
        ],
      ),
      SizedBox(width: kMainPadding),
      // Coment
      Expanded(
        child: Container(
          // height: 100,
          margin: EdgeInsets.only(bottom: kMainPadding / 2),
          padding: EdgeInsets.symmetric(
              horizontal: kMainPadding / 2, vertical: kMainPadding / 2),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.transparent, width: 1.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      CommentOptions(context, commentList);
                    },
                  )),
              Text(comment.content.toString(),
                  style: TextStyle(
                      color: Colors.white, fontFamily: "STC", fontSize: 14.5)),
              Container(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Text(TimeAgo().timeAgoSinceDate(comment.createdAt!),
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "STC",
                          color: Colors.grey[300],
                        )),
                    SizedBox(width: kMainPadding / 8),
                    Icon(
                      Icons.timer,
                      color: Colors.grey[300],
                      size: 17.5,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

void CommentOptions(context, List<String> options) {
  showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: options.map((option) {
                        return Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.symmetric(
                              horizontal: kMainPadding,
                              vertical: kMainPadding / 2),
                          child: Text(
                            option,
                            style: TextStyle(
                                fontFamily: "Changa",
                                color: Colors.black,
                                fontSize: 20),
                          ),
                        );
                      }).toList()),
                  Container()
                ],
              ),
            ),
          ),
        );
      });
}
