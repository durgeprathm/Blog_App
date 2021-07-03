import 'package:blogapp/Adaptor/Fetch_Blog_List_Deatils.dart';
import 'package:blogapp/Adaptor/Fetch_Favourite_Case_Study.dart';
import 'package:blogapp/Adaptor/Insert_like_Case_Study.dart';
import 'package:blogapp/Model/BlogDetails.dart';
import 'package:blogapp/Model/FavouriteCaseStudy.dart';
import 'package:blogapp/Pages/Second_New_Blog_Details_page.dart';
import 'package:blogapp/Pages/secondtestPage.dart';
import 'package:blogapp/Pages/testPage.dart';
import 'package:blogapp/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavoraitePage extends StatefulWidget {
  @override
  _FavoraitePageState createState() => _FavoraitePageState();
}

class _FavoraitePageState extends State<FavoraitePage> {
  List<String> categoryList = [
    "All",
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
  List<bool> categoryListCheck = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showspinner = false;
  List<BlogDetails> Bloglist = [];
  int rowcount = 0;
  bool heart = true;
  List<FavouriteCaseStudyCaseStudy> FavouriteCaseStudylist = [];
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: showspinner
            ? Center(child: CircularProgressIndicator())
            : rowcount >= 1
                ? Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                              itemCount: FavouriteCaseStudylist.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 15.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          title: Text(
                                              FavouriteCaseStudylist[index]
                                                  .FavouriteCase_Study_Name,
                                              style: blogTitleStyle),
                                          subtitle: Text("Nov 19",
                                              style: blogTitleStyle),
                                          tileColor: primaryColor,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 200,
                                          child: Image.network(
                                            FavouriteCaseStudylist[index]
                                                .Favouritecasestudy_image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 1, left: 16),
                                          title: Text(
                                              "Author: ${FavouriteCaseStudylist[index].FavouriteCaseStudy_Authername}",
                                              style: authorNameStyle),
                                          trailing: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                sendFavData(
                                                    FavouriteCaseStudylist[
                                                            index]
                                                        .FavouriteCase_Study_Id
                                                        .toString());
                                              },
                                              child: Container(
                                                child: FavouriteCaseStudylist[
                                                                index]
                                                            .Favourite_like_Status ==
                                                        "1"
                                                    ? Image.asset(
                                                        "assets/images/heart2.png",
                                                        color:
                                                            Color(0xFFFF4848),
                                                        width: 22,
                                                      )
                                                    : Image.asset(
                                                        "assets/images/heart.png",
                                                        color:
                                                            Color(0xFFFF4848),
                                                        width: 22,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(
                                              FavouriteCaseStudylist[index]
                                                  .FavouriteCaseStudy_Details,
                                              maxLines: 5,
                                              style: blogContentStyle,
                                              textAlign: TextAlign.justify),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (FavouriteCaseStudylist[index]
                                                    .Favourite_seen_Status ==
                                                "1") {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SecondNewBlogDetails(
                                                              FavouriteCaseStudylist[
                                                                      index]
                                                                  .FavouriteCase_Study_Id)));
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
                                                              FavouriteCaseStudylist[
                                                                      index]
                                                                  .FavouriteCase_Study_Id))));
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 5, left: 16, right: 16),
                                            child: Text("Read More",
                                                style: readMoreStyle),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 5,
                        ),
                        Image.asset(
                          "assets/images/feedback (3).png",
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 7,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Text(
                          "No Favourite Blog Yet",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Text(
                          "If You Are Seeing This By Mistake",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 99,
                        ),
                        Text(
                          "Please Let US Know",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                        OutlinedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(width: 5.0, color: Colors.black),
                            )),
                          ),
                          child: const Text(
                            "Contact Us",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }

  void initState() {
    _getFavouritecasestudylist("0");
  }

  void _getFavouritecasestudylist(String actionid) async {
    setState(() {
      showspinner = true;
    });
    try {
      FetchFavouriteCaseStudy fetchfavouritecasestudy =
          new FetchFavouriteCaseStudy();
      var fetchfavouritecasestudyData =
          await fetchfavouritecasestudy.getFetchFavouriteCaseStudy(actionid);
      if (fetchfavouritecasestudyData != null) {
        print("Inside the favourate//////////////////////////////////////");
        var resid = fetchfavouritecasestudyData["resid"];
        rowcount = fetchfavouritecasestudyData["rowcount"];
        if (resid == 200) {
          if (rowcount > 0) {
            var fetchfavouritecasestudysd =
                fetchfavouritecasestudyData["favouritecasestudylist"];
            print(fetchfavouritecasestudysd.length);
            List<FavouriteCaseStudyCaseStudy> tempfetchfavouritecasestudy = [];
            for (var n in fetchfavouritecasestudysd) {
              FavouriteCaseStudyCaseStudy pro = FavouriteCaseStudyCaseStudy(
                n["Likestatus"],
                n["seenstatus"],
                n["casestudyid"],
                n["CaseStudyname"],
                n["CaseStudyAuthername"],
                n["casestudyAutherimage"],
                n["CaseStudyDetails"],
                n["casestudyimage"],
                n["casestudyauthorid"],
              );
              tempfetchfavouritecasestudy.add(pro);
            }
            setState(() {
              this.FavouriteCaseStudylist = tempfetchfavouritecasestudy;
              showspinner = false;
            });

            print(
                "//////FavouriteCaseStudylist/////////${FavouriteCaseStudylist.length}");
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
}

class BlogWidget extends StatelessWidget {
  final String title;
  final String date;
  final String imagUrl;
  final String authorName;
  final String blog;

  BlogWidget(this.title, this.date, this.imagUrl, this.authorName, this.blog);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(title, style: blogTitleStyle),
              subtitle: Text(date, style: blogTitleStyle),
              tileColor: primaryColor,
            ),
            Container(
              child: Image(
                image: NetworkImage(imagUrl),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(bottom: 1, left: 16),
              title: Text("Author: $authorName", style: authorNameStyle),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(blog,
                  style: blogContentStyle, textAlign: TextAlign.justify),
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
    );
  }
}
