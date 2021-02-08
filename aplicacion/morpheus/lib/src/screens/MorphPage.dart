import 'package:flutter/material.dart';
import '../shared/Morph.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/partials.dart';
import '../shared/buttons.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MorphPage extends StatefulWidget {
  final String pageTitle;
  final Morph morphData;

  MorphPage({Key key, this.pageTitle, this.morphData}) : super(key: key);

  @override
  _MorphPageState createState() => _MorphPageState();
}

class _MorphPageState extends State<MorphPage> {
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
          title: Text(widget.morphData.name, style: h4),
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
                          Text(widget.morphData.name, style: h4),
                          Text("Modelo: "+widget.morphData.modelo, style: h5),
                          Text("Duracion: "+widget.morphData.duracion.toString(), style: h5),
                          Text("Fecha de creacion: "+"${widget.morphData.fecha.year.toString()}/${widget.morphData.fecha.month.toString().padLeft(2,'0')}/${widget.morphData.fecha.day.toString().padLeft(2,'0')}", style: h5),
                          Container(
                            width: 180,
                            child: froyoFlatBtn('Escuchar', () {})
                          )
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
                        child: morphItem(widget.morphData,
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
