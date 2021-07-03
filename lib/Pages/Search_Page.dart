import 'package:blogapp/Adaptor/Fetch_Blog_List_Deatils.dart';
import 'package:blogapp/Model/BlogDetails.dart';
import 'package:blogapp/Pages/Second_New_Blog_Details_page.dart';
import 'package:blogapp/Pages/secondtestPage.dart';
import 'package:blogapp/constant/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchListView extends StatefulWidget {
  @override
  _SearchListViewState createState() => _SearchListViewState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _SearchListViewState extends State<SearchListView> {
  List<BlogDetails> searchBloglist = [];
  bool enable = false;
  TextEditingController searchController = new TextEditingController();
  bool showspinner = false;
  List<BlogDetails> Bloglist = [];

  @override
  void initState() {
    _getBlogdetails("0");
  }

  void _getBlogdetails(String actionid) async {
    setState(() {
      showspinner = true;
    });
    try {
      FetchBlogList fetchbloglist = new FetchBlogList();
      var fetchbloglistDate = await fetchbloglist.getFetchBlogList(actionid);
      if (fetchbloglistDate != null) {
        var resid = fetchbloglistDate["resid"];
        var rowcount = fetchbloglistDate["rowcount"];
        if (resid == 200) {
          if (rowcount > 0) {
            var fetchdashauthorsd = fetchbloglistDate["bloglist"];
            print(fetchdashauthorsd.length);
            List<BlogDetails> tempBloglist = [];
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
              tempBloglist.add(pro);
            }
            setState(() {
              this.Bloglist = tempBloglist;
              showspinner = false;

              searchController.addListener(() {
                setState(() {
                  if (Bloglist != null) {
                    String s = searchController.text;
                    searchBloglist = Bloglist.where((element) => element
                        .blog_Name
                        .toString()
                        .toLowerCase()
                        .contains(s.toLowerCase())).toList();
                  }
                });
              });
            });

            print("//////Dashauthorlist/////////${Bloglist.length}");
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

  List<String> categoryList = [
    "Technologies",
    "Science",
    "World",
    "News",
    "Education",
    "Computer",
    "Sports",
    "IEEE",
    "Other",
  ];

  List<String> categoryimage = [
    "assets/icons/project-management.png",
    "assets/icons/science.png",
    "assets/icons/location.png",
    "assets/icons/news.png",
    "assets/icons/education.png",
    "assets/icons/monitor.png",
    "assets/icons/sports.png",
    "assets/icons/presentation.png",
    "assets/icons/layers.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Container(
          child: TextField(
            cursorColor: Colors.white,
            controller: searchController,
            onChanged: (value) {
              print(value);
              setState(() {
                enable = true;
              });
              if (searchController.text == "") {
                setState(() {
                  enable = false;
                });
              }
            },
            autofocus: true,
            style: TextStyle(color: Colors.white),
            decoration: new InputDecoration(
                suffixIcon: IconButton(
                  icon: enable
                      ? FaIcon(
                          FontAwesomeIcons.eyeSlash,
                          color: Colors.white,
                          size: 20,
                        )
                      : FaIcon(
                          FontAwesomeIcons.eye,
                          color: Colors.white,
                          size: 20,
                        ),
                  onPressed: () {
                    if (enable) {
                      setState(() {
                        enable = false;
                      });
                    } else {
                      setState(() {
                        enable = true;
                      });
                    }
                  },
                ),
                hintText: 'Start typing here...',
                focusColor: Colors.white,
                hoverColor: Colors.white,
                fillColor: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Visibility(
                visible: enable,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: searchBloglist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Material(
                            child: Container(
                              decoration: BoxDecoration(color: primaryColor),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                title: Text(
                                  Bloglist[index].blog_Name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white, size: 30.0),
                                onTap: () {
                                  if (Bloglist[index]
                                      .blog_seenstatus ==
                                      "1") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SecondNewBlogDetails(
                                                    Bloglist[
                                                    index]
                                                        .blog_Id)));
                                  } else {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) => SingleChildScrollView(
                                            child: Container(
                                                padding: EdgeInsets.only(
                                                    bottom: MediaQuery
                                                        .of(
                                                        context)
                                                        .viewInsets
                                                        .bottom),
                                                child: SecondTestPage(
                                                    Bloglist[
                                                    index]
                                                        .blog_Id))));
                                  }
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toastMethod(Color colr, String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: colr,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
