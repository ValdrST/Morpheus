import 'package:flutter/material.dart';
import '../shared/colors.dart';
import '../shared/buttons.dart';
import '../shared/fryo_icons.dart';
class Morphear extends StatefulWidget
{
  final String pageTitle;

  Morphear({Key key, this.pageTitle }) : super(key: key);

  @override
  _MorphearState createState() => _MorphearState();
}

class _MorphearState extends State<Morphear>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/morpheus.png', width: 190, height: 190),
          Container(
            margin: EdgeInsets.only(bottom: 0, top: 0)
          ),
          Container(
            decoration: const ShapeDecoration(
            color: bgColor,
            shape: CircleBorder(),
            ),
            width: 100,
            height: 100,
            padding: EdgeInsets.all(0),
            child: froyoIconBtn(Icon(Fryo.mic),'Presiona para grabar',(){}),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          )
        ],
      )),
      backgroundColor: white,
    );
  }

}

