//class GlobalData {
//  final String cases;
//  final String deaths;
//  final String recovered;
//
//
//
//  GlobalData({this.cases, this.deaths, this.recovered});
//
//  factory GlobalData.fromJSON(Map<String, dynamic> json) {
//    return GlobalData(
//        cases: json['cases'].toString(),
//        deaths: json['deaths'].toString(),
//        recovered: json['recovered'].toString());
//
//  }
//}


import '../utils.dart';

class GlobalData {
  final int cases;
  final int deaths;
  final int recovered;

  GlobalData({this.cases, this.deaths, this.recovered});
  factory GlobalData.fromJSON(Map<String, dynamic> json) {
    return GlobalData(
        cases: json['cases'].toInt(),
        deaths: json['deaths'].toInt(),
        recovered: json['recovered'].toInt());

  }

  String get confirmedText {
    return Utils.numberFormatter.format(cases);
  }

  String get deathsText {
    return Utils.numberFormatter.format(deaths);
  }

  String get recoveredText {
    return Utils.numberFormatter.format(recovered);
  }

  int get sick {
    return cases - deaths - recovered;
  }

  double get recoveryRate {
    return (recovered.toDouble() / cases.toDouble()) * 100;
  }

  double get fatalityRate {
    return (deaths.toDouble() / cases.toDouble()) * 100;
  }

  String get sickText {
    return Utils.numberFormatter.format(sick);
  }

  double get sickRate {
    return (sick.toDouble() / cases.toDouble()) * 100;
  }

  String get recoveryRateText {
    return "${recoveryRate.toStringAsFixed(2)}%";
  }

  String get fatalityRateText {
    return "${fatalityRate.toStringAsFixed(2)}%";
  }
}

