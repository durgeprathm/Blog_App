import 'package:blogapp/Adaptor/Fetch_Author_Dashboard_Deatils.dart';
import 'package:blogapp/Adaptor/Insert_like_Case_Study.dart';
import 'package:blogapp/Model/BlogDetails.dart';
import 'package:blogapp/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondNewBlogDetails extends StatefulWidget {
  final String blogid;
  SecondNewBlogDetails(this.blogid);
  @override
  _SecondNewBlogDetailsState createState() => _SecondNewBlogDetailsState();
}

class _SecondNewBlogDetailsState extends State<SecondNewBlogDetails> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showspinner = false;
  List<BlogDetails> BlogDetailslist = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: primaryColor,
      ),
      body: showspinner
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(BlogDetailslist[0].blog_Name,
                            style: authorNameStyle),
                      ),
                      Container(
                        child: Image(
                          image: NetworkImage(BlogDetailslist[0].blog_image),
                        ),
                      ),
                      ListTile(
                        title: Text(BlogDetailslist[0].blog_Author_Name,
                            style: authorNameStyle),
                        subtitle: Text("Nov 30"),
                        trailing: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () {
                              sendFavData(
                                  BlogDetailslist[0].blog_Id.toString());
                            },
                            child: Container(
                              child: BlogDetailslist[0].blog_Likestatus == "1"
                                  ? Image.asset(
                                      "assets/images/heart2.png",
                                      color: Color(0xFFFF4848),
                                      width: 22,
                                    )
                                  : Image.asset(
                                      "assets/images/heart.png",
                                      color: Color(0xFFFF4848),
                                      width: 22,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Over the past couple of years, I’ve been interested in the problem of “How do we make communication between Flutter and its host platform faster and easier?” This is a question of particular interest to Flutter plugin developers and add-to-app developers.',
                            textAlign: TextAlign.justify,
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Over the past couple of years, I’ve been interested in the problem of “How do we make communication between Flutter and its host platform faster and easier?” This is a question of particular interest to Flutter plugin developers and add-to-app developers.',
                            textAlign: TextAlign.justify,
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Over the past couple of years, I’ve been interested in the problem of “How do we make communication between Flutter and its host platform faster and easier?” This is a question of particular interest to Flutter plugin developers and add-to-app developers.',
                            textAlign: TextAlign.justify,
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Over the past couple of years, I’ve been interested in the problem of “How do we make communication between Flutter and its host platform faster and easier?” This is a question of particular interest to Flutter plugin developers and add-to-app developers.',
                            textAlign: TextAlign.justify,
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Over the past couple of years, I’ve been interested in the problem of “How do we make communication between Flutter and its host platform faster and easier?” This is a question of particular interest to Flutter plugin developers and add-to-app developers.',
                            textAlign: TextAlign.justify,
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Over the past couple of years, I’ve been interested in the problem of “How do we make communication between Flutter and its host platform faster and easier?” This is a question of particular interest to Flutter plugin developers and add-to-app developers.',
                            textAlign: TextAlign.justify,
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Over the past couple of years, I’ve been interested in the problem of “How do we make communication between Flutter and its host platform faster and easier?” This is a question of particular interest to Flutter plugin developers and add-to-app developers.',
                            textAlign: TextAlign.justify,
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Over the past couple of years, I’ve been interested in the problem of “How do we make communication between Flutter and its host platform faster and easier?” This is a question of particular interest to Flutter plugin developers and add-to-app developers.',
                            textAlign: TextAlign.justify,
                          ))
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  @override
  void initState() {
    _getAuthordetails("1", widget.blogid);
    _getSeenCasStudySubmitData("0", widget.blogid);
  }

  void _getAuthordetails(String actionid, String blogid) async {
    setState(() {
      showspinner = true;
    });
    try {
      FetchDashboardAuthorList fetchdashboardauthorlist =
          new FetchDashboardAuthorList();
      var fetchdashboardauthorlistDate = await fetchdashboardauthorlist
          .getFetchDashboardAuthorList(actionid, blogid);
      if (fetchdashboardauthorlistDate != null) {
        var resid = fetchdashboardauthorlistDate["resid"];
        var rowcount = fetchdashboardauthorlistDate["rowcount"];
        if (resid == 200) {
          if (rowcount > 0) {
            var fetchdashauthorsd =
                fetchdashboardauthorlistDate["caseStudyDetailslist"];
            print(fetchdashauthorsd.length);
            List<BlogDetails> tempDashauthordetails = [];
            for (var n in fetchdashauthorsd) {
              BlogDetails pro = BlogDetails(
                n["casestudyid"],
                n["CaseStudyname"],
                n["CaseStudyAuthername"],
                n["casestudyAutherimage"],
                n["CaseStudyDetails"],
                n["casestudyimage"],
                n["casestudyauthorid"],
                n["casestudyseenstatus"],
                n["casestudyLikestatus"],
              );
              tempDashauthordetails.add(pro);
            }
            setState(() {
              this.BlogDetailslist = tempDashauthordetails;
              showspinner = false;
            });

            print("//////Dashauthorlist/////////${BlogDetailslist.length}");
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

  sendFavData(String Caseid) async {
    // setState(() {
    //   showspinner = true;
    // });
    try {
      InsertLikeCaseStudy insertlikecasestudy = new InsertLikeCaseStudy();
      var result =
          await insertlikecasestudy.getInsertLikeCaseStudy('1', Caseid);
      if (result != null) {
        print("sendEnquiryData  ///${result}");
        var resid = result['resid'];
        var message = result["message"];
        if (resid == 200) {
          // setState(() {
          //   showspinner = false;
          // });
          Fluttertoast.showToast(
              msg: "$message",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          // setState(() {
          //   showspinner = false;
          // });
          Fluttertoast.showToast(
              msg: "$message",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        // setState(() {
        //   showspinner = false;
        // });
        _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: Text("Plz Try Again"),
          backgroundColor: Colors.green,
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  void _getSeenCasStudySubmitData(
    String actionid,
    String casestudyid,
  ) async {
    setState(() {
      showspinner = true;
    });
    try {
      InsertLikeCaseStudy insertseencasestudydetails =
          new InsertLikeCaseStudy();
      var insertseencasestudydetailsData =
          await insertseencasestudydetails.getInsertLikeCaseStudy(
        actionid,
        casestudyid,
      );
      if (insertseencasestudydetailsData != null) {
        print(
            "insertseencasestudydetailsData ///${insertseencasestudydetailsData}");
        var resid = insertseencasestudydetailsData['resid'];
        print("response from server ${resid}");
        if (resid == 200) {
          setState(() {
            showspinner = false;
          });
          Fluttertoast.showToast(
              msg: "Data Successfully Save !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
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
