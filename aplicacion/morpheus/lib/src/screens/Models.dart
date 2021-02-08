import 'package:flutter/material.dart';
import 'package:morpheus/src/screens/Morphear.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import './ModelPage.dart';
import '../shared/Product.dart';
import '../shared/Model.dart';
import '../shared/partials.dart';
import './Cart.dart';
import './Morphs.dart';
import './Morphear.dart';

class Models extends StatefulWidget {
  final String pageTitle;

  Models({Key key, this.pageTitle}) : super(key: key);

  @override
  _ModelsState createState() => _ModelsState();
}

class _ModelsState extends State<Models> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
  List<Model> modelos = [
    Model(
        name: "George Orwel",
        image: "images/morpheus_simple.png",
        isBuyed:true,
        daysLeft:"0",
        secPrice:"\$0.99",
        ),
    Model(
        name: "Elon Musk",
        image: "images/morpheus_simple.png",
        isBuyed:false,
        daysLeft:"10",
        secPrice:"\$0.99",
        ),
    Model(
        name: "Bill Gates",
        image: "images/morpheus_simple.png",
        isBuyed:false,
        daysLeft:"1",
        secPrice:"\$0.99",
        ),
    Model(
        name: "Roboto",
        image: "images/morpheus_simple.png",
        isBuyed:false,
        daysLeft:"0",
        secPrice:"\$0.99",
        ),
  ];

  return ListView(children: <Widget>[
    headerTopCategories(),
    deals('Mis Modelos', onViewMore: () {}, items: <Widget>[
      modelItem(modelos[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ModelPage(
                productData: modelos[0],
              );
            },
          ),
        );
      }),
      modelItem(modelos[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ModelPage(
                productData: modelos[1],
              );
            },
          ),
        );
      }, imgWidth:  60),
      modelItem(modelos[2], onTapped: () {
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ModelPage(
                productData: modelos[2],
              );
            },
          ),
        );
      }, imgWidth: 60, onLike: () {
       
      }),
      modelItem(modelos[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ModelPage(
                productData: modelos[3],
              );
            },
          ),
        );
      }, onLike: () {
        
      }),
    ]),
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
      )
    ],
  );
}

// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories() {
  return Column();
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 600,
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

