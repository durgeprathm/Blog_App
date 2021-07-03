import 'package:blogapp/Adaptor/Fetch_Blog_List_Deatils.dart';
import 'package:blogapp/Adaptor/Insert_like_Case_Study.dart';
import 'package:blogapp/Model/BlogDetails.dart';
import 'package:blogapp/Pages/Second_New_Blog_Details_page.dart';
import 'package:blogapp/Pages/secondtestPage.dart';
import 'package:blogapp/Pages/testPage.dart';
import 'package:blogapp/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: showspinner
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          itemCount: Bloglist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 15.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Text(Bloglist[index].blog_Name,
                                          style: blogTitleStyle),
                                      subtitle:
                                          Text("Nov 19", style: blogTitleStyle),
                                      tileColor: primaryColor,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      child: Image.network(
                                        Bloglist[index].blog_image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding:
                                          EdgeInsets.only(bottom: 1, left: 16),
                                      title: Text(
                                          "Author: ${Bloglist[index].blog_Author_Name}",
                                          style: authorNameStyle),
                                      trailing: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            sendFavData(Bloglist[index]
                                                .blog_Id
                                                .toString());
                                          },
                                          child: Container(
                                            child: Bloglist[index]
                                                        .blog_Likestatus ==
                                                    "1"
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
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 16, right: 16),
                                      child: Text(Bloglist[index].blog_Details,
                                          maxLines: 5,
                                          style: blogContentStyle,
                                          textAlign: TextAlign.justify),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (Bloglist[index].blog_seenstatus ==
                                            "1") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SecondNewBlogDetails(
                                                          Bloglist[index]
                                                              .blog_Id)));
                                        } else {
                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) =>
                                                  SingleChildScrollView(
                                                      child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child: SecondTestPage(
                                                        Bloglist[index]
                                                            .blog_Id),
                                                  )));
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
              ),
      ),
    );
  }

  // getuserdata()
  // async {
  //   var USERID = await SharedPreferencesConstants.instance
  //       .getStringValue(SharedPreferencesConstants.USERID);
  //   print("User ID ////////////////${USERID}");
  // }

  @override
  void initState() {
    print("IN INIT ");
    _getBlogdetails("0");
    //getuserdata();
  }

  void _getBlogdetails(String actionid) async {
    setState(() {
      showspinner = true;
    });
    try {
      FetchBlogList fetchbloglist = new FetchBlogList();
      var fetchbloglistDate = await fetchbloglist.getFetchBlogList(actionid);
      if (fetchbloglistDate != null) {
        print("fetchbloglistDate/////////////${fetchbloglistDate}");
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
