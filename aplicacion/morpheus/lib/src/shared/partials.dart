import 'package:flutter/material.dart';
import '../shared/Product.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';
import '../shared/Model.dart';
import '../shared/Morph.dart';
import '../shared/buttons.dart';

Widget foodItem(Product food,
    {double imgWidth, onLike, onTapped, bool isProductPage = false}) {
  return Container(
    width: 280,
    height: 380,
    // color: Colors.red,
    margin: EdgeInsets.only(left: 20),
    child: Stack(
      children: <Widget>[
        Container(
            width: 280,
            height: 280,
            child: RaisedButton(
                color: white,
                elevation: (isProductPage) ? 20 : 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: onTapped,
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: food.name,
                    child: Image.asset(food.image,
                        width: (imgWidth != null) ? imgWidth : 100)))),
        Positioned(
          bottom: (isProductPage) ? 10 : 70,
          right: 0,
          child: FlatButton(
              padding: EdgeInsets.all(20),
              shape: CircleBorder(),
              onPressed: onLike),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(food.name, style: foodNameText),
                    Text(food.price, style: priceText),
                  ],
                )
              : Text(' '),
        )
      ],
    ),
  );
}

Widget modelItem(Model model,
    {double imgWidth, onLike, onTapped, bool isProductPage = false}) {
  return Container(
    width: 280,
    height: 200,
    // color: Colors.red,
    margin: EdgeInsets.only(left: 20),
    child: Column(
      children: <Widget>[
        Positioned(
          bottom: 20,
          left: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(model.name, style: foodNameText),
                  ],
                )
              : Text(' '),
        ),
        Container(
            width: 380,
            height: (!isProductPage)?450:150,
            child: RaisedButton(
                color: white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: onTapped,
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: model.name,
                    child: Image.asset(model.image,
                        width: (imgWidth != null) ? imgWidth : 100))))
      ],
    ),
  );
}

Widget morphItem(Morph morph,
    {double imgWidth, onLike, onTapped, bool isProductPage = false}) {
  return Container(
    width: 150,
    height: 120,
    margin: EdgeInsets.all(10),
    decoration: (!isProductPage) ? BoxDecoration(
      border: Border.all(color: Colors.blueAccent),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0)
    ),
    ):BoxDecoration(),
    child: Column(
      children: <Widget>[
        Positioned(
          bottom: 10,
          left: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(morph.name, style: h4,textAlign: TextAlign.justify,),
                  ],
                )
              : Text(' '),
        ),
        (!isProductPage) ? froyoFlatBtn('Escuchar', onTapped):Container()
      ],
    ),
  );
}


