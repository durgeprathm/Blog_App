import 'package:flutter/material.dart';

class EventTile extends StatefulWidget {
  @override
  String imgAssetPath;
  String eventType;
  EventTile(this.imgAssetPath, this.eventType);
  _EventTileState createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: Color(0xff29404E), borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              widget.imgAssetPath,
              height: 27,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.eventType,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}