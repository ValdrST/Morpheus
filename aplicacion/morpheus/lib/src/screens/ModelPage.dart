import 'package:flutter/material.dart';
import '../shared/Model.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/partials.dart';
import '../shared/buttons.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ModelPage extends StatefulWidget {
  final String pageTitle;
  final Model productData;

  ModelPage({Key key, this.pageTitle, this.productData}) : super(key: key);

  @override
  _ModelPageState createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  double _rating = 4;
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 10,
          backgroundColor: bgColor,
          centerTitle: true,
          leading: BackButton(
            color: darkText,
          ),
          title: Text(widget.productData.name, style: h4),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                      margin: EdgeInsets.only(top: 100, bottom: 100),
                      padding: EdgeInsets.only(top: 100, bottom: 50),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.productData.name, style: h4),
                          !widget.productData.isBuyed ? Text("Dias restantes: "+widget.productData.daysLeft, style: h3):Container(),
                          !widget.productData.isBuyed ? Text(widget.productData.secPrice +"/segundo", style: h3):Text("", style: h3),
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 20),
                            child: SmoothStarRating(
                              allowHalfRating: false,
                              onRatingChanged: (v) {
                                setState(() {
                                  _rating = v;
                                });
                              },
                              starCount: 5,
                              rating: _rating,
                              size: 27.0,
                              color: Colors.orange,
                              borderColor: Colors.orange,
                            ),
                          ),
                          !widget.productData.isBuyed ?
                          Container(
                            width: 180,
                            child: froyoOutlineBtn('Comprar', () {}),
                          ):
                          Container(
                            width: 180,
                            child: froyoFlatBtn('Usar', () {}),
                          ),
                          (!widget.productData.isBuyed && widget.productData.daysLeft == "0")?
                          Container(
                            width: 180,
                            child: froyoOutlineBtn('Rentar 1 mes', () {}),
                          ):Container(),
                          (!widget.productData.isBuyed  && widget.productData.daysLeft == "0")?
                          Container(
                            width: 180,
                            child: froyoOutlineBtn('Plan x segundo', () {}),
                          ):Container(),
                          (!widget.productData.isBuyed  && widget.productData.daysLeft != "0")?
                          Container(
                            width: 180,
                            child: froyoFlatBtn('Usar', () {}),
                          ):Container()

                        ],
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 5,
                                color: Color.fromRGBO(0, 0, 0, .05))
                          ]),
                    ),
                    ),
                    Align(
                        alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        height: 360,
                        child: modelItem(widget.productData,
                            isProductPage: true,
                            onTapped: () {},
                            imgWidth: 450,
                            onLike: () {}),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
