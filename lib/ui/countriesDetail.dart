import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'countries.dart';

class CountryDetails extends StatelessWidget {
  final String countryName;
  final String totalRecoverd;
  final int totalCases;
  final int totalDeaths;
  final int activeCases;
  final int cCases;
  final int totalTests;
  final int todayCases;
  final int todayDeaths;

  const CountryDetails(
      {Key key,
      this.countryName,
      this.totalRecoverd,
      this.totalCases,
      this.totalDeaths,
      this.activeCases,
      this.cCases,
      this.totalTests,
      this.todayCases,
      this.todayDeaths})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
          expandedHeight: height * 0.26,
          pinned: true,
          backgroundColor: Colors.indigo,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(countryName),

          ),
        ),
          SliverFillRemaining(
            child: Column(children: <Widget>[
              Card(
                shadowColor: Colors.deepPurple,elevation: 10.0,
               // color: Colors.lime,
                child: ListTile(
                  leading: Icon(Icons.sentiment_dissatisfied,color: Colors.red,),
                  title: Text("Total death: $totalDeaths"),
                )
              ),
              Card(
                shadowColor: Colors.deepOrange,elevation: 10.0,
                  child: ListTile(
                    leading: Icon(Icons.refresh,color: Colors.lime,),
                    title: Text("Total Recovered:  $totalRecoverd"),
                  )
              ),
              Card(
                shadowColor: Colors.blue,elevation: 10.0,
                  child: ListTile(
                    leading: Icon(Icons.add,color: Colors.red,),
                    title: Text("Total Tests: $totalTests"),
                  )
              ),
              Card(
                shadowColor: Colors.green,elevation: 10.0,
                  child: ListTile(
                    leading: Icon(Icons.timeline,color: Colors.deepPurple,),
                    title: Text("Total cases: $totalCases"),
                  )
              )
            ]),
          )

      ]  )
      ),
    );
  }
}
