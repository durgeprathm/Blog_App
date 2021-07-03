
import 'package:blogapp/Adaptor/Fetch_Author_Dashboard_Deatils.dart';
import 'package:blogapp/Adaptor/Insert_like_Case_Study.dart';
import 'package:blogapp/Model/BlogDetails.dart';
import 'package:blogapp/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BlogDetailPage extends StatefulWidget {
  @override
  String blogid;
  BlogDetailPage(this.blogid);
  _BlogDetailPageState createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showspinner = false;
  List<BlogDetails> BlogDetailslist = [];
  Widget build(BuildContext context) {

    // final levelIndicator = Container(
    //   child: Container(
    //     child: LinearProgressIndicator(
    //         backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
    //         value: 5,
    //         valueColor: AlwaysStoppedAnimation(Colors.green)),
    //   ),
    // );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "New",
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              BlogDetailslist.length != 0
                  ? BlogDetailslist[0].blog_Author_Name
                  : "",
              style: blogdetailsauthornametextStyle,
            )
          ],
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          BlogDetailslist.length != 0 ? BlogDetailslist[0].blog_Name : "",
          style: blogdetailsblognametextStyle,
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "22 jun 2021",
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        // Container(
        //     padding: EdgeInsets.only(left: 10.0),
        //     height: MediaQuery.of(context).size.height * 0.5,
        //     decoration: new BoxDecoration(
        //       image: new DecorationImage(
        //         image: new AssetImage("drive-steering-wheel.jpg"),
        //         fit: BoxFit.cover,
        //       ),
        //     )),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: primaryColor),
          child: Center(
            child: topContentText,
          ),
        ),
        // Positioned(
        //   left: 8.0,
        //   top: 60.0,
        //   child: InkWell(
        //     onTap: () {
        //       //Navigator.pop(context);
        //     },
        //     child: Icon(Icons.arrow_back, color: Colors.white),
        //   ),
        // )
      ],
    );

    final bottomContentText = Text(
      BlogDetailslist.length != 0 ? BlogDetailslist[0].blog_Details : "",
      style: blogdetailtextStyle,
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: primaryColor,
          child: Text("READ MORE", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      //backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: showspinner
            ? Center(
                child: Container(
                    child: CircularProgressIndicator(
                backgroundColor: primaryColor,
              )))
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[topContent, bottomContent],
                  ),
                ),
              ),
      ),
    );
  }

  @override
  void initState() {
    showspinner = true;
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
