import 'dart:convert';
import 'package:fluttercovid/model/countriesData.dart';
import 'package:fluttercovid/model/globalData.dart';
import 'package:fluttercovid/model/news.dart';
import 'package:fluttercovid/model/townshipData.dart';
import 'package:http/http.dart' as http;

class CovidAPI {

  Future<GlobalData> getCase() async {
    String url = 'https://coronavirus-19-api.herokuapp.com/all';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return GlobalData.fromJSON(json.decode(response.body));
    } else {
      throw Exception("Failed to load Post");
    }
  }




  Future<CountryDataList> getCountryData() async {
    String url = 'https://coronavirus-19-api.herokuapp.com/countries';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonRes = json.decode(response.body);
      return CountryDataList.fromJson(jsonRes);
    } else {
      throw Exception("Failed due to Network Error");
    }
  }

  Future<News> getNews() async {
    String url = 'https://newsapi.org/v2/everything?q=COVID&sortBy=publishedAt&apiKey=db71a7563e2445ac8093ac8034a97f4a&pageSize=100&page=1';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Post");
    }
  }

  Future<township> getTownshipData() async {
    String url = 'http://myancity.devsm.net/townships';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonRes = json.decode(response.body);
      return township.fromJson(jsonRes);
    } else {
      throw Exception("Failed due to Network Error");
    }
  }

}





//
//bottomNavigationBar: FFNavigationBar(
//theme: FFNavigationBarTheme(
//barBackgroundColor: Colors.white,
//selectedItemBorderColor: Colors.yellow,
//selectedItemBackgroundColor: Colors.green,
//selectedItemIconColor: Colors.white,
//selectedItemLabelColor: Colors.black,
//),
//onSelectTab: _onItemTapped
//items: [
//FFNavigationBarItem(
//iconData: Icons.group,
//label: 'Global',
//
//),
//FFNavigationBarItem(
//iconData: Icons.list,
//label: 'Countries',
//),
//FFNavigationBarItem(
//iconData: Icons.phone,
//label: 'Phone',
//
//),
//FFNavigationBarItem(
//iconData: Icons.info,
//label: 'News',
//),
//],
//),
//
//





//bottomNavigationBar: BubbledNavigationBar(
////        height: height*0.06,
////        color: Colors.white,
//onTap: _onItemTapped,
//backgroundColor: Colors.white,
//items: <BubbledNavigationBarItem>[
//BubbledNavigationBarItem(
//icon: Icon(CupertinoIcons.group_solid, size: 30, color: Colors.red),
//activeIcon:
//Icon(CupertinoIcons.group_solid, size: 30, color: Colors.white),
//title: Text(
//'Global',
//style: TextStyle(color: Colors.white, fontSize: 12),
//),
//),
//BubbledNavigationBarItem(
//icon: Icon(CupertinoIcons.home, size: 30, color: Colors.red),
//activeIcon:
//Icon(CupertinoIcons.home, size: 30, color: Colors.white),
//title: Text(
//'Countries',
//style: TextStyle(color: Colors.white, fontSize: 12),
//),
//),
//BubbledNavigationBarItem(
//icon: Icon(CupertinoIcons.phone, size: 30, color: Colors.red),
//activeIcon:
//Icon(CupertinoIcons.phone, size: 30, color: Colors.white),
//title: Text(
//'Phone',
//style: TextStyle(color: Colors.white, fontSize: 12),
//),
//),
//BubbledNavigationBarItem(
//icon: Icon(CupertinoIcons.news, size: 30, color: Colors.red),
//activeIcon:
//Icon(CupertinoIcons.news, size: 30, color: Colors.white),
//title: Text(
//'News',
//style: TextStyle(color: Colors.white, fontSize: 12),
//),
//),
//],
//),

//selectedIndex: selectedIndex,
//onSelectTab: (_onItemTapped) {
//setState(() {
//selectedIndex = _onItemTapped;
//});
//},