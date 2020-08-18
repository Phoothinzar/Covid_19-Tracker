//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:fluttercovid/api/covidApi.dart';
//import 'package:progress_indicators/progress_indicators.dart';
//
//class StateList extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//
//
//    return Scaffold(
//      body: Container(
//        color: Colors.white70,
//        width: width,
//        height: height,
//        child: FutureBuilder(
//          future: CovidAPI().getTownshipData(),
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
//                      title: Text(snapshot.data.[index].countryName),
//                      onTap: () {},
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
//}
