import 'package:flutter/material.dart';
import 'package:morpheus/src/screens/Morphear.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import './ProductPage.dart';
import '../shared/Product.dart';
import '../shared/partials.dart';
import './Cart.dart';
import './Morphs.dart';
import './Models.dart';
import './Morphear.dart';

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title:
              Text('Morpheus', style: logoWhiteStyle, textAlign: TextAlign.center)
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Fryo.shop),
                title: Text(
                  'Tienda',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.cart),
                title: Text(
                  'Carrito',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.music),
                title: Text(
                  'Morphs',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.user_1),
                title: Text(
                  'Modelos',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.sound),
                title: Text(
                  'Morphear',
                  style: tabLinkStyle,
                ))
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0xff0741ad),
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget cartTab(BuildContext context){
  return ListView(children: <Widget>[

  ]);
}

Widget storeTab(BuildContext context) {

  // will pick it up from here
  // am to start another template
  List<Product> foods = [
    Product(
        name: "Luis Miguel",
        image: "images/morpheus_simple.png",
        price: "\$25.00",
        monthPrice: "\$2.50",
        secPrice: "\$0.99",
        userLiked: true,
        discount: 10),
    Product(
        name: "Universal Stereo",
        image: "images/morpheus_simple.png",
        price: "\$150.00",
        monthPrice: "\$1.50",
        secPrice: "\$0.99",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Michael Jackson",
      image: 'images/morpheus_simple.png',
      price: '\$10.99',
      monthPrice: "\$1.09",
      secPrice: "\$0.99",
      userLiked: false,
    ),
    Product(
        name: "Trump",
        image: "images/morpheus_simple.png",
        price: '\$50.00',
        monthPrice: "\$5.00",
        secPrice: "\$0.99",
        userLiked: true,
        discount: 14)
  ];

  List<Product> drinks = [
    Product(
        name: "Mr. Pickles",
        image: "images/morpheus_simple.png",
        price: "\$45.12",
        monthPrice: "\$4.51",
        secPrice: "\$0.99",
        userLiked: true,
        discount: 2),
    Product(
        name: "Perry el ornitorringo",
        image: "images/morpheus_simple.png",
        price: "\$28.00",
        monthPrice: "\$2.80",
        secPrice: "\$0.99",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Pavarotti",
        image: "images/morpheus_simple.png",
        price: "\$78.99",
        monthPrice: "\$7.89",
        secPrice: "\$0.99",
        userLiked: false),
    Product(
        name: "Roboto",
        image: "images/morpheus_simple.png",
        price: "\$168.99",
        monthPrice: "\$16.89",
        secPrice: "\$0.99",
        userLiked: true,
        discount: 3.4)
  ];

  return ListView(children: <Widget>[
    headerTopCategories(),
    deals('Ofertas', onViewMore: () {}, items: <Widget>[
      foodItem(foods[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[0],
              );
            },
          ),
        );
      }, onLike: () {foods[0].userLiked = !foods[0].userLiked;}),
      foodItem(foods[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[1],
              );
            },
          ),
        );
      }, imgWidth:  60, onLike: () {
        foods[1].userLiked = !foods[1].userLiked;
      }),
      foodItem(foods[2], onTapped: () {
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[2],
              );
            },
          ),
        );
      }, imgWidth: 200, onLike: () {
       
      }),
      foodItem(foods[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[3],
              );
            },
          ),
        );
      }, onLike: () {
        
      }),
    ]),
    deals('Los mas comprados', onViewMore: () {}, items: <Widget>[
      foodItem(drinks[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[0],
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 60),
      foodItem(drinks[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[1],
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 60),
      foodItem(drinks[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[2],
              );
            },
          ),
        );
      }, imgWidth: 60, onLike: () {}),
      foodItem(drinks[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[3],
              );
            },
          ),
        );
      }, onLike: () {}),
    ])
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
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('Categorias', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Artistas', Fryo.star_1, onPressed: () {}),
            headerCategoryItem('Politicos', Fryo.briefcase, onPressed: () {}),
            headerCategoryItem('Personas', Fryo.user_1, onPressed: () {}),
            headerCategoryItem('Ficcion', Fryo.bug, onPressed: () {}),
            headerCategoryItem('Comunidad', Fryo.leaf, onPressed: () {}),
          ],
        ),
      )
    ],
  );
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
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
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

