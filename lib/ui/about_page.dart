import 'package:flutter/material.dart';
import 'package:fluttercovid/api/web_view_detail.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {

  var howItSpreadsUrl = "https://www.cdc.gov/coronavirus/2019-ncov/prepare/transmission.html";
  var symptomsUrl = "https://www.cdc.gov/coronavirus/2019-ncov/symptoms-testing/symptoms.html";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.deepPurple[100],
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              var webViewDetails = WebViewDetails(title: 'How it spreads?', url: howItSpreadsUrl);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => webViewDetails),
              );
            },
            child: getSingleFaqView('How it spreads?',
                'Learn how Covid-19 spreads', 'images/faq_howitspreads.png'),
          ),
          InkWell(
            onTap: () {
              var webViewDetails = WebViewDetails(title: 'Symptoms', url: symptomsUrl);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => webViewDetails),
              );
            },
            child: getSingleFaqView('Symptoms',
                'Learn Covid-19 symptoms', 'images/faq_symptoms.png'),
          ),
        ],
      ),
    );
  }

  Widget getSingleFaqView(String title, String subtitle, String imageSrc) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20,left: 15, right: 15, bottom: 15),
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 15.0,
            ),
          ]),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
//          Container(
//            width: 60,
//            height: 60,
//            child: Image.asset(
//              imageSrc,
//              fit: BoxFit.cover,
//            ),
//          ),
//          SizedBox(
//            width: 30,
//          ),
          Container(
            height: 40,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    textAlign: TextAlign.left,

                  ),
                ),
//                SizedBox(
//                  height: 5,
//                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    subtitle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}