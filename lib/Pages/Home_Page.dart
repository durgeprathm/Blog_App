import 'package:blogapp/Pages/testPage.dart';
import 'package:blogapp/constant/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0, bottom: 15.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Monthly Case Study",
                    style: HomepageTitleStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Image(
                  image: AssetImage("assets/images/demo2.png"),
                ),
              ),
              ListTile(
                title: Text("Improving Platform Channel Performance in Flutter",
                    style: blogTitleStyle),
                //subtitle: Text("Nov 29", style: blogTitleStyle),
                tileColor: primaryColor,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(bottom: 1, left: 16),
                subtitle: Text("Nov 29", style: blogDateStyle),
                title: Text("Author: Aaron Clarke", style: authorNameStyle),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                    "Over the past couple of years, I’ve been interested in the problem of “How do we make communication between Flutter and its host platform faster and easier?” This is a question of particular interest to Flutter plugin developers and add-to-app developers.",
                    style: blogContentStyle,
                    textAlign: TextAlign.justify),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                              child: Container(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: TestPage(
                                "Improving Platform Channel Performance in Flutter",
                                "Nov 29",
                                "assets/images/demo2.png",
                                "Aaron Clarke"),
                          )));
                },
                child: Container(
                  padding: EdgeInsets.only(top: 5, left: 16, right: 16),
                  child: Text("Read More", style: readMoreStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
