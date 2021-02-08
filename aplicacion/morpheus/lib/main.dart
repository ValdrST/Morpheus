import 'package:flutter/material.dart';
import './src/screens/SignInPage.dart';
import './src/screens/SignUpPage.dart';
import './src/screens/HomePage.dart';
import './src/screens/Dashboard.dart';
import './src/screens/ProductPage.dart';
import './src/screens/Cart.dart';
import './src/screens/Morphs.dart';
import './src/screens/Models.dart';
import './src/screens/Morphear.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morpheus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(pageTitle: 'Welcome'),
      routes: <String, WidgetBuilder> {
        '/signup': (BuildContext context) =>  SignUpPage(),
        '/signin': (BuildContext context) =>  SignInPage(),
        '/shop': (BuildContext context) => Dashboard(),
        '/productPage': (BuildContext context) => ProductPage(),
        '/cart': (BuildContext context) => Cart(),
        '/morphs': (BuildContext context) => Morphs(),
        '/models': (BuildContext context) => Models(),
        '/morphear': (BuildContext context) => Morphear(),
      },
    );
  }
}