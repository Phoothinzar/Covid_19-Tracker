//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:fluttercovid/ui/countries.dart';
//
//class BottomNavigation extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => BottomNavigationState();
//}
//
//class BottomNavigationState extends State<BottomNavigation> with TickerProviderStateMixin {
//
//  int _selectedIndex = 0;
//  final List<Widget> children = [ Country()];
//
//  static const List<Widget> widgetOption = <Widget>[];
//
//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//    return Scaffold(
//      bottomNavigationBar: CurvedNavigationBar(
//        color: Colors.white,
//        backgroundColor: Colors.orange,
//        buttonBackgroundColor: Colors.brown,
//        height: height*0.50,
//        items: [
//          Icon(Icons.track_changes,size: 20.0,color: Colors.black,),
//          Icon(Icons.event,size: 20.0,color: Colors.black,),
//          Icon(Icons.subject,size: 20.0,color: Colors.black,)
//        ],
//        animationDuration: Duration(
//          milliseconds: 200,
//        ),
//        animationCurve: Curves.bounceInOut,
//        onTap: (index){
//          debugPrint("Current index is $index");
//
//        },
//      ),
//    );
//  }
//}
