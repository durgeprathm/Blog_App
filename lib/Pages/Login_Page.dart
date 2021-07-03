import 'package:blogapp/Pages/DashBoard.dart';
import 'package:blogapp/Pages/SignUp_Page.dart';
import 'package:blogapp/constant/const.dart';
import 'package:blogapp/constant/shared_preference_constants.dart';
import 'package:blogapp/widgets/LoginContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

const mailiocons = Padding(
  padding: const EdgeInsets.all(8.0),
  child: FaIcon(
    FontAwesomeIcons.envelope,
    color: primaryColor,
  ),
);
const eyeiocons = Padding(
  padding: const EdgeInsets.all(8.0),
  child: FaIcon(
    FontAwesomeIcons.eyeSlash,
    color: primaryColor,
  ),
);

String username = "";
String Password = "";
bool spinner = false;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _LoginPageState extends State<LoginPage> {
  @override
  final _text = TextEditingController();
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: spinner
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: -height * .15,
                        right: -MediaQuery.of(context).size.width * .4,
                        child: loginpageContainer()),
                    ListView(children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: height * .2),
                            _title(),
                            SizedBox(height: 35),
                            _emailPasswordWidget(),
                            SizedBox(height: 15),
                            _submitButton(),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.centerRight,
                              child: Text('Forgot Password ?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: primaryColor)),
                            ),
                            _divider(),
                            _facebookButton(),
                            // SizedBox(height: height),
                            _createAccountLabel(),
                          ],
                        ),
                      ),
                    ]),
                    Positioned(top: 40, left: 0, child: _backButton()),
                  ],
                ),
              ));
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username", mailiocons, 1),
        _entryField("Password", eyeiocons, 2, isPassword: true),
      ],
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: primaryColor),
            ),
            Text('Back',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: primaryColor))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, font, identify, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: primaryColor),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              onChanged: (newValue) {
                setState(() {
                  if (identify == 1) {
                    username = newValue;
                  } else if (identify == 2) {
                    Password = newValue;
                  }
                });
              },
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  suffixIcon: font,
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        if (username == "Prathmesh" && Password == "prathmesh123") {
          print("Inside If");
          print("username //////////${username}");
          print("Password //////////${Password}");
          //_sendUserData(username.toString(), Password.toString());

          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return DashBoardPage();
            }),
          );

          var UserID="1";
          SharedPreferencesConstants.instance
              .setStringValue(SharedPreferencesConstants.USERID, UserID);
          SharedPreferencesConstants.instance
              .setBooleanValue(SharedPreferencesConstants.LOGGEDIN, true);


        } else {
          Fluttertoast.showToast(
              msg: "Username Or Password Is Empty",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [primaryColor, primaryColor])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  // _sendUserData(String UserName, String password) async {
  //   setState(() {
  //     spinner = true;
  //   });
  //   try {
  //     FetchLogin fetchlogin = new FetchLogin();
  //     var result = await fetchlogin.getFetchLogin(UserName, password);
  //     if (result != null) {
  //       var resid = result['resid'];
  //       var message = result["message"];
  //       if (resid == 200) {
  //         var UserID = result["id"];
  //         var UserName = result["username"];
  //         var UserEmail = result["email"];
  //         var UserFullName = result["fullname"];
  //
  //         SharedPreferencesConstants.instance
  //             .setStringValue(SharedPreferencesConstants.USERID, UserID);
  //         SharedPreferencesConstants.instance.setStringValue(
  //             SharedPreferencesConstants.USERFULLNAME, UserFullName);
  //         SharedPreferencesConstants.instance.setStringValue(
  //             SharedPreferencesConstants.USEREMAILID, UserEmail);
  //         SharedPreferencesConstants.instance
  //             .setStringValue(SharedPreferencesConstants.USERNAME, UserName);
  //         SharedPreferencesConstants.instance
  //             .setBooleanValue(SharedPreferencesConstants.LOGGEDIN, true);
  //
  //         setState(() {
  //           spinner = false;
  //         });
  //
  //         Fluttertoast.showToast(
  //             msg: "$message",
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.BOTTOM,
  //             timeInSecForIosWeb: 3,
  //             backgroundColor: Colors.green,
  //             textColor: Colors.white,
  //             fontSize: 16.0);
  //
  //         Navigator.of(context).push(
  //           MaterialPageRoute(builder: (_) {
  //             return DashBoardPage();
  //           }),
  //         );
  //       } else {
  //         setState(() {
  //           spinner = false;
  //         });
  //         Fluttertoast.showToast(
  //             msg: "$message",
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.BOTTOM,
  //             timeInSecForIosWeb: 3,
  //             backgroundColor: Colors.green,
  //             textColor: Colors.white,
  //             fontSize: 16.0);
  //       }
  //     } else {
  //       setState(() {
  //         spinner = true;
  //       });
  //       _scaffoldKey.currentState!.showSnackBar(SnackBar(
  //         content: Text("Plz Try Again"),
  //         backgroundColor: Colors.green,
  //       ));
  //     }
  //   } catch (e) {
  //     print(e);
  //     setState(() {
  //       spinner = true;
  //     });
  //   }
  // }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or', style: TextStyle(color: primaryColor)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage("assets/images/google.png"),
            ),
          ),
          CircleAvatar(
            backgroundColor: primaryColor,
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage("assets/images/facebook.png"),
            ),
          ),
          CircleAvatar(
            backgroundColor: primaryColor,
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage("assets/images/twitter.png"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: primaryColor),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'C',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
          children: [
            TextSpan(
              text: 'ase',
              style: TextStyle(color: Colors.brown, fontSize: 30),
            ),
            TextSpan(
              text: '-',
              style: TextStyle(color: Colors.brown, fontSize: 30),
            ),
            TextSpan(
              text: 'Study',
              style: TextStyle(color: primaryColor, fontSize: 30),
            ),
          ]),
    );
  }
}

// Row(
// children: <Widget>[
// Expanded(
// flex: 1,
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xff1959a9),
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(5),
// topLeft: Radius.circular(5)),
// ),
// alignment: Alignment.center,
// child: Text('f',
// style: TextStyle(
// color: Colors.white,
// fontSize: 25,
// fontWeight: FontWeight.w400)),
// ),
// ),
// Expanded(
// flex: 5,
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xff2872ba),
// borderRadius: BorderRadius.only(
// bottomRight: Radius.circular(5),
// topRight: Radius.circular(5)),
// ),
// alignment: Alignment.center,
// child: Text('Log in with Facebook',
// style: TextStyle(
// color: Colors.white,
// fontSize: 18,
// fontWeight: FontWeight.w400)),
// ),
// ),
// ],
// )
