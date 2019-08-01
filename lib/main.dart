import 'package:flutter/material.dart';
import 'package:flutter_zone_food_amin_panel/ui/Authentication.dart';
import 'package:flutter_zone_food_amin_panel/ui/Login.dart';
import 'package:flutter_zone_food_amin_panel/ui/Mapping.dart';
import 'Screen/add_kitchens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Admin Panel - Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: MappingPage(auth: Auth(),)

    );
  }
}
