import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  WebViewController _controller;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: 'https://www.trackcorona.live/map',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
//              loadEmbeddedCode();
            },
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? Center(child: CircularProgressIndicator()) : Container(),
        ],
      ),
    );
  }

  String getEmbeddedCode() {
    return '<!DOCTYPE html> <html> <head><title>Page Title</title> <style>body {background-color: white;text-align: center;color: white;font-family: Arial, Helvetica, sans-serif;}</style></head> <body> <p><a href="https://commons.wikimedia.org/wiki/File:COVID-19_Outbreak_World_Map_per_Capita.svg#/media/File:COVID-19_Outbreak_World_Map_per_Capita.svg"><img style="width:4600px;height:2000px;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/COVID-19_Outbreak_World_Map_per_Capita.svg/1200px-COVID-19_Outbreak_World_Map_per_Capita.svg.png" alt="COVID-19 Outbreak World Map per Capita.svg"></a></p></body></html>';
  }

  void loadEmbeddedCode() {
    _controller.loadUrl(Uri.dataFromString(getEmbeddedCode(),
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}




//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//class Countries {
//  final String name;
//  final int cases;
//
//  Countries(this.name, this.cases)
//      : assert(name != null),
//        assert(cases != null);
//}
//
//class MapScreen extends StatefulWidget {
//  final List<dynamic> endpointsData;
//  final double latitude;
//  final double longitude;
//  final bool confirmed;
//  final bool recovered;
//  final bool deaths;
//  final String assetName;
//  final String title;
//
//  const MapScreen(
//      {Key key,
//        @required this.endpointsData,
//        @required this.latitude,
//        @required this.longitude,
//        @required this.assetName,
//        @required this.confirmed,
//        @required this.recovered,
//        @required this.deaths,
//        @required this.title})
//      : super(key: key);
//  @override
//  _MapScreenState createState() => _MapScreenState();
//}
//
//class _MapScreenState extends State<MapScreen> {
//  GoogleMapController _controller;
//  Map<Countries, LatLng> allLatLongsData;
//
//  @override
//  void initState() {
//    allLatLongsData = {};
//    generateAllLatLongs();
//    super.initState();
//  }
//
//  Map<Countries, LatLng> generateAllLatLongs() {
//    widget.endpointsData.forEach((value) {
//      if (value['lat'] != null && value['long'] != null) {
//        final latitude = value['lat'].toDouble();
//        final longitude = value['long'].toDouble();
//        final name = value['provinceState'] != null
//            ? value['provinceState']
//            : value['countryRegion'];
//        final cases = widget.confirmed
//            ? value['confirmed']
//            : (widget.recovered ? value['recovered'] : value['deaths']);
//        allLatLongsData[Countries(name, cases)] = LatLng(latitude, longitude);
//      }
//    });
//    return allLatLongsData;
//  }
//
//  Future<Set<Marker>> generateMarkers(Map<Countries, LatLng> positions) async {
//    List<Marker> markers = <Marker>[];
//    final icon = await BitmapDescriptor.fromAssetImage(
//        ImageConfiguration(), widget.assetName);
//    positions.forEach((k, v) {
//      final marker = Marker(
//          markerId: MarkerId(k.name),
//          position: LatLng(v.latitude, v.longitude),
//          icon: icon,
//          infoWindow:
//          InfoWindow(title: '${k.name}', snippet: 'Cases: ${k.cases}'),
//          anchor: Offset(0.5, 0.5));
//      markers.add(marker);
//    });
//    return markers.toSet();
//  }
//
//  Future<String> getJsonFile(String path) async {
//    return await rootBundle.loadString(path);
//  }
//
//  void setMapStyle(String mapStyle) {
//    _controller.setMapStyle(mapStyle);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SafeArea(
//        child: Stack(
//          children: <Widget>[
//            FutureBuilder(
//              future: generateMarkers(allLatLongsData),
//              initialData: Set.of(<Marker>[]),
//              builder: (context, snapshot) => GoogleMap(
//                initialCameraPosition: CameraPosition(
//                    target: LatLng(widget.latitude, widget.longitude)),
//                markers: snapshot.data,
//                mapToolbarEnabled: false,
//                rotateGesturesEnabled: false,
//                scrollGesturesEnabled: true,
//                // zoomGesturesEnabled: false,
//                onMapCreated: (GoogleMapController controller) {
//                  _controller = controller;
//                  getJsonFile("assets/map_styles/style.json").then(setMapStyle);
//                },
//              ),
//            ),
//            Positioned.fill(
//              child: Align(
//                  alignment: Alignment.topCenter,
//                  child: Container(
//                      width: double.infinity,
//                      height: 50,
//                      decoration: BoxDecoration(
//                        color: Color.fromRGBO(23, 27, 30, .75),
//                      ),
//                      child: Center(
//                        child: Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Text(
//                              'Global ${widget.title} cases per country/region/state'
//                                  .toUpperCase(),
//                              textAlign: TextAlign.center,
//                              style: Theme.of(context)
//                                  .textTheme
//                                  .subtitle2
//                                  .copyWith(
//                                letterSpacing: .75,
//                              )),
//                        ),
//                      ))),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}