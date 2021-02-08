import 'package:flutter/material.dart';
import '../shared/Product.dart';
import '../shared/colors.dart';

class Cart extends StatefulWidget {
  final String pageTitle;

  Cart({Key key, this.pageTitle}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> itemList = [
    Product(
        name: "Universal",
        image: "images/morpheus_simple.png",
        price: "\$25.00",
        monthPrice: "\$2.50",
        secPrice: "\$0.99",
        userLiked: true,
        discount: 10),
    Product(
        name: "Jeff B",
        image: "images/morpheus_simple.png",
        price: "\$150.00",
        monthPrice: "\$1.50",
        secPrice: "\$0.99",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Row K",
      image: 'images/morpheus_simple.png',
      price: '\$10.99',
      monthPrice: "\$1.09",
      secPrice: "\$0.99",
      userLiked: false,
    ),
    Product(
        name: "mr. pickles",
        image: "images/morpheus_simple.png",
        price: '\$50.00',
        monthPrice: "\$5.00",
        secPrice: "\$0.99",
        userLiked: true,
        discount: 14)
  ];
  String toolbarname = 'My Cart (4)';
  IconData _backIcon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    IconData _add_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.add_circle;
        case TargetPlatform.iOS:
          return Icons.add_circle;
      }
      assert(false);
      return null;
    }

    IconData _sub_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.remove_circle;
        case TargetPlatform.iOS:
          return Icons.remove_circle;
      }
      assert(false);
      return null;
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double dd = width * 0.93;
    double hh = height - 245.0;
    int item = 0;
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle =
        theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 10.0),
              child: Card(
                  child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: GestureDetector(
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween))))),
          Container(
              margin: EdgeInsets.only(
                  left: 12.0, top: 5.0, right: 12.0, bottom: 0.0),
              height: hh,
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext cont, int ind) {
                    return SafeArea(
                        child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          Container(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 120.0,
                                    width: dd,
                                    child: Card(
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                              height: 100.0,
                                              width: 100.0,
                                              child: Image.asset(
                                                itemList[ind].image,
                                                fit: BoxFit.fill,
                                              )),
                                          SizedBox(
                                              height: 110.0,
                                              child: Container(
                                                alignment: Alignment.topLeft,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    _verticalD(),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          itemList[ind].name,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18.0,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    _verticalD(),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          itemList[ind].price,
                                                          style: TextStyle(
                                                              fontSize: 15.0,
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                          Positioned(
                                                            top: 10,
                                                            left: 100,
                                                            child: (itemList[
                                                                            ind]
                                                                        .discount !=
                                                                    null)
                                                                ? Container(
                                                                    padding: EdgeInsets.only(
                                                                        top: 5,
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10,
                                                                        bottom:
                                                                            5),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.grey[
                                                                            600],
                                                                        borderRadius:
                                                                            BorderRadius.circular(50)),
                                                                    child: Text(
                                                                        '-' +
                                                                            itemList[ind]
                                                                                .discount
                                                                                .toString() +
                                                                            '%',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w700)),
                                                                  )
                                                                : SizedBox(
                                                                    width: 100))
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ));
                  })
                ),
          Container(
              alignment: Alignment.bottomLeft,
              height: 60.0,
              child: Card(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.info), onPressed: null),
                    Text(
                      'Total :',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$ 524',
                      style: TextStyle(fontSize: 17.0, color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: OutlineButton(
                            borderSide: BorderSide(color: primaryColor),
                            child: const Text('Confirmar Orden'),
                            textColor: primaryColor,
                            onPressed: () {},
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 07.0, bottom: 0.0),
      );

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('You selected: $value')));
      }
    });
  }
}
