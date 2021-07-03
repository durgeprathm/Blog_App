import 'package:blogapp/Adaptor/Fetch_Feedback_Question_List_Deatils.dart';
import 'package:blogapp/Model/FeedbackQuestions.dart';
import 'package:blogapp/Pages/Blog_Details_Page.dart';
import 'package:blogapp/Pages/New_Blog_Details_page.dart';
import 'package:blogapp/Pages/Second_New_Blog_Details_page.dart';
import 'package:blogapp/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondTestPage extends StatefulWidget {
  @override
  final String Blogid;

  SecondTestPage(this.Blogid);
  _SecondTestPageState createState() => _SecondTestPageState();
}

List Questionlist = [
  "How visually appealing is our website?",
  "How visually appealing is our website?",
  "How visually appealing is our website?",
  "How visually appealing is our website?",
];

List optionlist = [
  "POOR#AVERAGE#GOOD#EXCELLENT",
  "POOR#AVERAGE#GOOD#EXCELLENT",
  "POOR#AVERAGE#GOOD#EXCELLENT",
  "POOR#AVERAGE#GOOD#EXCELLENT",
];

List seprateoption = [];

int index = 0;
bool checkoption1 = false;
bool checkoption2 = false;
bool checkoption3 = false;
bool checkoption4 = false;

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _SecondTestPageState extends State<SecondTestPage> {
  @override
  bool showspinner = false;
  List<FeedBackQuestion> FeedbackList = [];
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: showspinner
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Text(
                    "Feedback",
                    style: authorNameStyle,
                  ),
                  Text(
                    "Before viewing detailed case study, you have go through some simple questions.",
                    style: subHeadingStyle,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 15,
                    child: Divider(
                      thickness: 1.5,
                      color: primaryColor,
                    ),
                  ),
                  Container(
                    height: 110.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: SizedBox(
                        child: Text(
                          FeedbackList[index].Feedback_Question,
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          style: authorNameStyle,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        checkoption1 = true;
                        checkoption2 = false;
                        checkoption3 = false;
                        checkoption4 = false;
                      });
                    },
                    child: Container(
                      height: 55.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: checkoption1 ? Colors.brown : primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.white,
                              child: Text(
                                "A",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            height: 35.0,
                            child: Center(
                              child: Text(
                                seprateoption[0],
                                style: optionsStyle,
                              ),
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        checkoption1 = false;
                        checkoption2 = true;
                        checkoption3 = false;
                        checkoption4 = false;
                      });
                    },
                    child: Container(
                      height: 55.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: checkoption2 ? Colors.brown : primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.white,
                              child: Text("B"),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            height: 35.0,
                            child: Center(
                              child:
                                  Text(seprateoption[1], style: optionsStyle),
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        checkoption1 = false;
                        checkoption2 = false;
                        checkoption3 = true;
                        checkoption4 = false;
                      });
                    },
                    child: Container(
                      height: 55.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: checkoption3 ? Colors.brown : primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.white,
                              child: Text("C"),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            height: 35.0,
                            child: Center(
                              child:
                                  Text(seprateoption[2], style: optionsStyle),
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        checkoption1 = false;
                        checkoption2 = false;
                        checkoption3 = false;
                        checkoption4 = true;
                      });
                    },
                    child: Container(
                      height: 55.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: checkoption4 ? Colors.brown : primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.white,
                              child: Text("D"),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            height: 35.0,
                            child: Center(
                              child:
                                  Text(seprateoption[3], style: optionsStyle),
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Material(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15.0),
                      child: MaterialButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("NEXT", style: optionsStyle),
                            SizedBox(
                              width: 15.0,
                            ),
                            FaIcon(
                              FontAwesomeIcons.arrowCircleRight,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        minWidth: 150,
                        height: 25.0,
                        onPressed: () async {
                          setState(() {
                            if (index < (FeedbackList.length - 1)) {
                              if (checkoption1 == true ||
                                  checkoption2 == true ||
                                  checkoption3 == true ||
                                  checkoption4 == true) {
                                index = index + 1;
                                seprateoption = FeedbackList[index]
                                    .Feedback_option
                                    .split("#");
                                checkoption1 = false;
                                checkoption2 = false;
                                checkoption3 = false;
                                checkoption4 = false;
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Kindly Select Any Option",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } else {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondNewBlogDetails(widget.Blogid)));
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  void initState() {
    index = 0;
    _getFeedbacklist("0");
  }

  void _getFeedbacklist(String actionid) async {
    setState(() {
      showspinner = true;
    });
    try {
      FetchFeedBackQuestionList fetchfeedbackquestionlist =
          new FetchFeedBackQuestionList();
      var feedbackquestionlistData =
          await fetchfeedbackquestionlist.getFeedBackQuestionList(actionid);
      if (feedbackquestionlistData != null) {
        var resid = feedbackquestionlistData["resid"];
        var rowcount = feedbackquestionlistData["rowcount"];
        if (resid == 200) {
          if (rowcount > 0) {
            var feedbackquestionlistsd =
                feedbackquestionlistData["feedbackquetionlist"];
            print(feedbackquestionlistsd.length);
            List<FeedBackQuestion> tempfeedbackquestionlist = [];
            for (var n in feedbackquestionlistsd) {
              FeedBackQuestion pro = FeedBackQuestion(
                n["feedback_id"],
                n["feedback_questions"],
                n["feedback_options"],
              );
              tempfeedbackquestionlist.add(pro);
            }
            setState(() {
              this.FeedbackList = tempfeedbackquestionlist;
              seprateoption = FeedbackList[index].Feedback_option.split("#");
              showspinner = false;
            });

            print("//////FeedbackListlist/////////${FeedbackList.length}");
          } else {
            setState(() {
              showspinner = false;
            });
          }
        } else {
          setState(() {
            showspinner = false;
          });
          _scaffoldKey.currentState?.showSnackBar(SnackBar(
            content: Text("Plz Try Again"),
            backgroundColor: Colors.green,
          ));
        }
      } else {
        setState(() {
          showspinner = false;
          _scaffoldKey.currentState?.showSnackBar(SnackBar(
            content: Text("Some Technical Problem Plz Try Again Later"),
            backgroundColor: Colors.green,
          ));
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
