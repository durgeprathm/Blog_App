import 'package:blogapp/widgets/Clippage.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class loginpageContainer extends StatefulWidget {
  @override
  _loginpageContainerState createState() => _loginpageContainerState();
}

class _loginpageContainerState extends State<loginpageContainer> {
  // const loginpageContainer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
      angle: -pi / 3.5,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff17445A), Color(0xff17445A)])),
        ),
      ),
    ));
  }
}
