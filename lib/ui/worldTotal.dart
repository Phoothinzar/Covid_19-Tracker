import 'package:flutter/material.dart';
import 'package:fluttercovid/api/covidApi.dart';
import 'package:fluttercovid/model/globalData.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../utils.dart';

class WorldTotal extends StatefulWidget {
  @override
  _WorldTotalState createState() => _WorldTotalState();
}

class _WorldTotalState extends State<WorldTotal> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
//      backgroundColor: Colors.teal,
        body: Center(
            child: Container(
              color: Colors.white,
                constraints: BoxConstraints(maxWidth: 768),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      _buildTotalCountWidget(context),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Divider(),
                      ),

                    ],
                  ),
                ))));
  }

  Widget _buildTotalCountWidget(BuildContext context) {
    return FutureBuilder(
        future: CovidAPI().getCase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.error != null) {
            return Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Center(
                  child: Text('Error fetching total count data'),
                ));
          } else {
            final GlobalData totalCount = snapshot.data;

            final data = [
              LinearCases(CaseType.sick.index, totalCount.cases,
                  totalCount.cases.toInt(), "Cases"),
              LinearCases(CaseType.deaths.index, totalCount.deaths,
                  totalCount.deaths.toInt(), "Deaths"),
              LinearCases(CaseType.recovered.index, totalCount.recovered,
                  totalCount.recovered.toInt(), "Recovered")
            ];

            final series = [
              charts.Series<LinearCases, int>(
                id: 'Total Count',
                domainFn: (LinearCases cases, _) => cases.type,
                measureFn: (LinearCases cases, _) => cases.total,
                labelAccessorFn: (LinearCases cases, _) =>
                '${cases.text}\n${Utils.numberFormatter.format(cases.count)}',
                colorFn: (cases, index) {
                  switch (cases.text) {
                    case "Case":
                      return charts.ColorUtil.fromDartColor(
                          Colors.teal);
                    case "Recovered":
                      return charts.ColorUtil.fromDartColor(Colors.green);
                    default:
                      return charts.ColorUtil.fromDartColor(Colors.red);
                  }
                },
                data: data,
              )
            ];

            return Padding(
                padding:
                EdgeInsets.only(top: 16, left: 0, right: 0, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          "Last updated: ${Utils.dateFormatter.format(
                              DateTime.now())}"),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      Text(
                        "Global Cases",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline,
                      ),
                      Container(
                        color: Colors.blueGrey[100],
                          height: 200,
                          child: charts.PieChart(
                            series,
                            animate: true,
                            defaultRenderer: charts.ArcRendererConfig(
                                arcWidth: 60,
                                arcRendererDecorators: [
                                  charts.ArcLabelDecorator()
                                ]),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    totalCount.cases.toString(),
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline
                                        .apply(color: Colors.indigo),
                                  ),
                                  Text("Cases")
                                ],
                              )
                            ]),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      totalCount.recovered.toString(),
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .headline
                                          .apply(color: Colors.green),
                                    ),
                                    Text("Recovered")
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(totalCount.deaths.toString(),
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .headline
                                          .apply(color: Colors.red),),
                                    Text("Death")
                                  ],
                                )
                              ])),
                    ]));
          }
        });
  }

}
enum CaseType { confirmed, deaths, recovered, sick }

class LinearCases {
  final int type;
  final int count;
  final int total;
  final String text;

  LinearCases(this.type, this.count, this.total, this.text);


}
