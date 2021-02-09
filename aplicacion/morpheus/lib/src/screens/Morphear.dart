import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../shared/colors.dart';
import '../shared/buttons.dart';
import '../shared/fryo_icons.dart';
import '../shared/styles.dart';
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
          Container(
              child: Text('Modelo usado', style: logoMorpheusStyle, textAlign: TextAlign.center)
          ),
          Container(
            decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Text('Roboto', style: logoMorpheusStyle, textAlign: TextAlign.center)
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50, top: 50),
          child: Image.asset('images/morpheus.png', width: 190, height: 190),
          ),
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
            child: froyoIconBtn(Icon(Fryo.mic),'Presiona para grabar',(){Toast.show("Morpheando tu voz", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);}),
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

