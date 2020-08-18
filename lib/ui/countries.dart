
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercovid/api/covidApi.dart';
import 'package:fluttercovid/model/countriesData.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';

import 'countriesDetail.dart';

//class Country extends StatefulWidget {
//  @override
//  _CountryState createState() => _CountryState();
//}
//
//class _CountryState extends State<Country> {
//  final formatter = NumberFormat("###,###");
//
//  List filteredNames = new List();
//  bool isSearching = false;
//  bool _isChoose = false;
//  final dio = new Dio();
//  List names = new List();
//
//  String _searchText = "";
//  Icon _searchIcon = new Icon(Icons.search);
//
//  void _getNames() async {
//    final response =
//        await dio.get('https://coronavirus-19-api.herokuapp.com/countries');
//    List tempList = new List();
//    for (int i = 0; i < response.data['results'].length; i++) {
//      tempList.add(response.data['results'][i]);
//    }
//
//    setState(() {
//      names = tempList;
//      filteredNames = names;
//    });
//  }
//
//
//  void _searchPressed() {
//    setState(() {
//      if (this._searchIcon.icon == Icons.search) {
//        this._searchIcon = new Icon(Icons.close);
//        this._appBarTitle = new TextField(
//          controller: _filter,
//          decoration: new InputDecoration(
//              prefixIcon: new Icon(Icons.search),
//              hintText: 'Search...'
//          ),
//        );
//      } else {
//        this._searchIcon = new Icon(Icons.search);
//        this._appBarTitle = new Text('Search Example');
//        filteredNames = names;
//        _filter.clear();
//      }
//    });
//  }
//
//
//  ExamplePageState() {
//    _filter.addListener(() {
//      if (_filter.text.isEmpty) {
//        setState(() {
//          _searchText = "";
//          filteredNames = names;
//        });
//      } else {
//        setState(() {
//          _searchText = _filter.text;
//        });
//      }
//    });
//  }
//
////  @override
////  void initState() {
////    _isChoose = false;
////    this._getNames();
////    super.initState();
////  }
////
////  void toogleFromMode() {
////    setState(() {
////      _isChoose = !_isChoose;
////    });
////  }
////
////  void _getNames() async {
////    final response = await dio.get('https://swapi.co/api/people');
////    List tempList = new List();
////    for (int i = 0; i < response.data['results'].length; i++) {
////      tempList.add(response.data['results'][i]);
////    }
////    setState(() {
////      names = tempList;
////      names.shuffle();
////      filteredNames = names;
////    });
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.indigo,
//        title: TextField(
//          decoration: InputDecoration(
//            //  icon: Icon(Icons.search),
//              hintText: "Search Country here",
//              hintStyle: TextStyle(color: Colors.orange)),
//        ),
//        actions: [
//          isSearching
//              ? IconButton(
//                  icon: Icon(Icons.cancel),
//                  onPressed: () {
//                    setState(() {
//                      this.isSearching = !this.isSearching;
//                    });
//                  },
//                )
//              : IconButton(
//                  icon: Icon(Icons.search),
//                  onPressed: () {
//                    setState(() {
//                      this.isSearching = true;
//                    });
//                  },
//                )
//        ],
//      ),
//      body: Container(
//        color: Colors.white70,
//        width: width,
//        height: height,
//        child: FutureBuilder(
//          future: CovidAPI().getCountryData(),
//          builder: (context, snapshot) {
//            if (snapshot.hasData) {
//              return ListView.builder(
//                padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
//                itemCount: snapshot.data.countries.length,
//                itemBuilder: (context, index) {
//                  return Card(
//                    color: Colors.white,
//                    child: ListTile(
//                      focusColor: Colors.deepOrange,
//                      trailing: Icon(Icons.play_arrow),
////                      (_isChoose == false)
////                          ? Icon(Icons.favorite_border)
////                          : Icon(
////                              Icons.favorite,
////                              color: Colors.red,
////                            ),
//                      title: Text(snapshot.data.countries[index].countryName),
//                      subtitle: Text(
//                          "Cases: ${snapshot.data.countries[index].countryCases}"),
//                      onTap: () {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => CountryDetails(
//                                      countryName: snapshot
//                                          .data.countries[index].countryName,
//                                      totalCases: snapshot
//                                          .data.countries[index].countryCases,
//                                      totalRecoverd: snapshot.data
//                                          .countries[index].countryRecovered,
//                                      totalDeaths: snapshot
//                                          .data.countries[index].countryDeaths,
//                                      todayCases: snapshot
//                                          .data.countries[index].todayCases,
//                                      todayDeaths: snapshot
//                                          .data.countries[index].todayDeaths,
//                                      activeCases: snapshot
//                                          .data.countries[index].activeCases,
//                                      cCases: snapshot
//                                          .data.countries[index].critCases,
//                                      totalTests: snapshot
//                                          .data.countries[index].totalTests,
//                                    )));
//                      },
//                    ),
//                  );
//                },
//              );
//            } else if (snapshot.hasError) {
//              return Center(
//                child: Text("${snapshot.error}"),
//              );
//            } else {
//              return Center(
//                child: HeartbeatProgressIndicator(
//                  child: SizedBox(
//                      height: 50.0,
//                      child: Image(
//                        height: MediaQuery.of(context).size.height * 0.02,
//                        image: AssetImage('images/loader.png'),
//                        color: Theme.of(context).accentColor,
//                      )),
//                ),
//              );
//            }
//          },
//        ),
//      ),
//    );
//  }
//  Widget _buildList() {
//    if (!(_searchText.isEmpty)) {
//      List tempList = new List();
//      for (int i = 0; i < filteredNames.length; i++) {
//        if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
//          tempList.add(filteredNames[i]);
//        }
//      }
//      filteredNames = tempList;
//    }
//    return ListView.builder(
//      itemCount: names == null ? 0 : filteredNames.length,
//      itemBuilder: (BuildContext context, int index) {
//        return new ListTile(
//          title: Text(filteredNames[index]['name']),
//          onTap: () => print(filteredNames[index]['name']),
//        );
//      },
//    );
//  }
//}


class Country extends StatefulWidget {
  // ExamplePage({ Key key }) : super(key: key);
  @override
  CountryState createState() => new CountryState();
}

class CountryState extends State<Country> {
  // final formKey = new GlobalKey<FormState>();
  // final key = new GlobalKey<ScaffoldState>();


  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Here' ,style: TextStyle(fontSize: 12.0),);

    @override
  void initState() {
//    this._buildList();
    this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {

    final formatter = NumberFormat("###,###");

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
      color: Colors.white70,
      width: width,
      height: height,
      child:  FutureBuilder(
        future: CovidAPI().getCountryData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
              itemCount: snapshot.data.countries.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    focusColor: Colors.deepOrange,
                    trailing: Icon(Icons.play_arrow),
                    title: Text(snapshot.data.countries[index].countryName),
                    subtitle: Text(
                        "Cases: ${formatter.format(snapshot.data.countries[index].countryCases)}"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryDetails(
                                countryName: snapshot
                                    .data.countries[index].countryName,
                                totalCases: snapshot
                                    .data.countries[index].countryCases,
                                totalRecoverd: snapshot.data
                                    .countries[index].countryRecovered,
                                totalDeaths: snapshot
                                    .data.countries[index].countryDeaths,
                                todayCases: snapshot
                                    .data.countries[index].todayCases,
                                todayDeaths: snapshot
                                    .data.countries[index].todayDeaths,
                                activeCases: snapshot
                                    .data.countries[index].activeCases,
                                cCases: snapshot
                                    .data.countries[index].critCases,
                                totalTests: snapshot
                                    .data.countries[index].totalTests,
                              )));
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else {
            return Center(
              child: HeartbeatProgressIndicator(
                child: SizedBox(
                    height: 50.0,
                    child: Image(
                      height: MediaQuery.of(context).size.height * 0.02,
                      image: AssetImage('images/loader.png'),
                      color: Theme.of(context).accentColor,
                    )),
              ),
            );
          }
        },
      ),
    ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.indigo,
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,



      ),
    );
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
//              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...',
          ),
          onChanged: (filteredNames){
            setState(() {
              _buildList();
            });
          },
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Search Here' );
        filteredNames = names;
        _filter.clear();
      }
    }
    );
  }

  void _getNames() => CovidAPI().getCountryData();

}