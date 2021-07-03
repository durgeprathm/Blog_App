import 'package:blogapp/Pages/Login_Page.dart';
import 'package:blogapp/constant/const.dart';
import 'package:blogapp/widgets/LoginContainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  // SignUpPage({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;
String username = "";
String Password = "";
String Email = "";
const Useriocons = Padding(
  padding: const EdgeInsets.all(8.0),
  child: FaIcon(
    FontAwesomeIcons.user,
    color: primaryColor,
  ),
);
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

class _SignUpPageState extends State<SignUpPage> {
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

  Widget _entryField(String title, String identify, font,
      {bool isPassword = false}) {
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
          TextFormField(
              obscureText: isPassword,
              validator: (value) {
                // setState(() {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter some text';
                //   } else if (identify == "1") {
                //     String pattern = r'(^[a-zA-Z0-9 ]*$)';
                //     RegExp regExp = new RegExp(pattern);
                //     if (value.isEmpty || value == null) {
                //       return 'Please Enter UserName';
                //     } else {
                //       if (!regExp.hasMatch(value)) {
                //         return 'Username must be a-z and A-Z';
                //       } else {
                //         return "";
                //       }
                //     }
                //   } else if (identify == "2") {
                //     Pattern pattern =
                //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                //     RegExp regex = new RegExp(pattern.toString());
                //
                //     if (value == null || value == null) {
                //       return 'Please Enter Email';
                //     } else {
                //       if (!regex.hasMatch(value))
                //         return 'Enter Valid Email';
                //       else
                //         return "";
                //     }
                //   } else if (identify == "3") {
                //     if (value.isEmpty || value == null) {
                //       return 'Please Enter Password';
                //     } else {
                //       if (value.length < 6) {
                //         return 'Password must be at least 6 characters';
                //       } else {
                //         return "";
                //       }
                //     }
                //   }
                // });
              },
              onChanged: (value) {
                setState(() {
                  if (identify == "1") {
                    username = value;
                  } else if (identify == "2") {
                    Email = value;
                  } else if (identify == "3") {
                    Password = value;
                  }
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: font,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _validateInputs();
        });
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
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: primaryColor),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
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
            color: Color(0xff17445A),
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
              style: TextStyle(color: Color(0xff17445A), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username", "1", Useriocons),
        _entryField("Email id", "2", mailiocons),
        _entryField("Password", "3", eyeiocons, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: loginpageContainer(),
            ),
            ListView(children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    new Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: _emailPasswordWidget(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: 2),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ]),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }

  // //Validation For UserName
  // String validateUsername(String value) {
  //
  // }
  //
  // //for validating password
  // String validatePassword(String value) {
  //
  //   //  return null;
  // }
  //
  // //validation for email id
  // String validateEmail(String value) {
  //
  // }

  //for checking all the validation
  Future<void> _validateInputs() async {
    if (_formKey.currentState?.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
