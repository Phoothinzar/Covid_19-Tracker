import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercovid/ui/countries.dart';
import 'package:fluttercovid/ui/about_page.dart';
import 'package:fluttercovid/ui/map.dart';
import 'package:fluttercovid/ui/phone_page.dart';
import 'package:fluttercovid/ui/news_view.dart';
import 'package:fluttercovid/ui/worldTotal.dart';

class  HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screen = [WorldTotal(), Country(), PhonePage(), FaqPage(),MapPage()];
  int selectedIndex = 0;

//  MyTheme currentTheme = MyTheme();

  void _onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }
//
//  @override
//  void initState() {
//    super.initState();
//    currentTheme.addListener(() {
//      print("Change");
//      setState(() {});
//    });
//  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.white70,
          selectedItemBackgroundColor: Colors.indigo[200],
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            _onItemTapped(selectedIndex);
            _onPageChanged(index);
          });
        },
        items: <FFNavigationBarItem>[
          FFNavigationBarItem(
            iconData: Icons.group,
            label: 'Global',
          ),
          FFNavigationBarItem(
            iconData: Icons.list,
            label: 'Countries',
            selectedBackgroundColor: Colors.pink[200],
          ),
          FFNavigationBarItem(
            iconData: Icons.phone,
            label: 'Phone',
            selectedBackgroundColor: Colors.deepOrange[200],

          ),
          FFNavigationBarItem(
            iconData: Icons.info,
            label: 'News',
            selectedBackgroundColor: Colors.green[300],

          ),
          FFNavigationBarItem(
            iconData: Icons.map,
            label: 'Map',
            selectedBackgroundColor: Colors.pink[600],

          ),

        ],
      ),
    );
  }
}
