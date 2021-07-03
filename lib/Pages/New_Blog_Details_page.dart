import 'package:blogapp/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewBlogDetails extends StatefulWidget {
  final String studyName;
  final String date;
  final String img;
  final String authName;

  NewBlogDetails(this.studyName, this.date, this.img, this.authName);
  @override
  _NewBlogDetailsState createState() => _NewBlogDetailsState();
}

class _NewBlogDetailsState extends State<NewBlogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.studyName, style: authorNameStyle),
                ),
                Container(
                  child: Image(
                    image: AssetImage(widget.img),
                  ),
                ),
                ListTile(
                  title: Text(widget.authName, style: authorNameStyle),
                  subtitle: Text(widget.date),
                  trailing: FaIcon(
                    FontAwesomeIcons.heart,
                    color: Colors.redAccent,
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
}
