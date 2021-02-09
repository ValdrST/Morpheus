import 'package:flutter/material.dart';
import '../shared/colors.dart';
import '../shared/Morph.dart';
import './Cart.dart';
import './Models.dart';
import './Morphear.dart';
import './MorphPage.dart';
import '../shared/partials.dart';
import '../shared/styles.dart';

class Morphs extends StatefulWidget
{
  final String pageTitle;

  Morphs({Key key, this.pageTitle }) : super(key: key);

  @override
  _MorphsState createState() => _MorphsState();
}

class _MorphsState extends State<Morphs>{
  
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context)
  {
    final _tabs = [
      storeTab(context),
      Cart(),
      Morphs(),
      Models(),
      Morphear(),
    ];

    return Scaffold(
        backgroundColor: white,
        body: _tabs[_selectedIndex]);
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget storeTab(BuildContext context) {

  // will pick it up from here
  // am to start another template
  List<Morph> morphs = [
    Morph(
        name: "Dialogos #1",
        modelo: "George Orwell",
        duracion: new Duration(minutes: 1, seconds: 32),
        fecha:  new DateTime(2021,2,4)
        ),
    Morph(
        name: "Conferencia Fake #2",
        modelo: "Bill Gates",
        duracion: new Duration(minutes: 1,seconds: 12),
        fecha:  new DateTime(2021,2,2),
        ),
    Morph(
        name: "Dialogos GOW",
        modelo: "Carlos Segundo",
        duracion: new Duration(minutes: 1,seconds: 12),
        fecha:  new DateTime(2021,2,1),
        ),
    Morph(
        name: "Dialogos #4",
        modelo: "Roboto",
        duracion: new Duration(minutes: 1,seconds: 12),
        fecha:  new DateTime(2021,2,3),
        ),
  ];

  return ListView(children: <Widget>[
    headerTopCategories(),
    morphList('Mis Morphs', onViewMore: () {}, items: <Widget>[
      morphItem(morphs[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new MorphPage(
                morphData: morphs[0],
              );
            },
          ),
        );
      }),
      morphItem(morphs[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new MorphPage(
                morphData: morphs[1],
              );
            },
          ),
        );
      }, imgWidth:  60),
      morphItem(morphs[2], onTapped: () {
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new MorphPage(
                morphData: morphs[2],
              );
            },
          ),
        );
      }, imgWidth: 60, onLike: () {
       
      }),
      morphItem(morphs[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new MorphPage(
                morphData: morphs[3],
              );
            },
          ),
        );
      }, onLike: () {
        
      }),
    ]),
  ]);
}

Widget morphList(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 500,
          width: 800,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 50),
                      child: Text('No items available at this moment.',
                          style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}
