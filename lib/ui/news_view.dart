import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercovid/api/covidApi.dart';
import 'package:fluttercovid/model/news.dart';
import 'package:http/http.dart'as http;
import 'package:progress_indicators/progress_indicators.dart';

class NewsView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NewsViewState();
  }

}

class _NewsViewState extends State<NewsView> {

  var Url= "https://newsapi.org/v2/everything?q=COVID&sortBy=publishedAt&apiKey=db71a7563e2445ac8093ac8034a97f4a&pageSize=100&page=1";

  News news;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(Url);

    var decodeJson = jsonDecode(res.body);

    news = News.fromJson(decodeJson);

    print(news.toJson());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: FutureBuilder(
          future: CovidAPI().getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.02),
                itemCount: news.articles.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blueGrey,

                    child: ListTile(
                      leading: SizedBox(
                      width: 60,
                      child: (news.articles[index].urlToImage == null)
                          ? Image.network(
                          'https://yt3.ggpht.com/a/AATXAJzP8iiqrbsEgxZHXXZynrPyJGPVbD3o4xIbov9tchg=s900-c-k-c0xffffffff-no-rj-mo')
                          : Image.network(
                        news.articles[index].urlToImage,
                        width: 100,
                        fit: BoxFit.fill,
                      ),

                    ),
                      trailing: Icon(Icons.play_arrow, size: height * 0.02),
                      title: Text(news.articles[index].title),
//                      subtitle: Text(news.articles[index].description),
                      onTap: () {

                        Navigator.push(context,MaterialPageRoute(builder: (context) =>
                            Details(articles: news.articles[index])));

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
                child:  CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }


}

class Details extends StatelessWidget {
  Articles articles;

  Details(
      {this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      child:  (articles.urlToImage == null)
                          ? Image.network(
                          'https://yt3.ggpht.com/a/AATXAJzP8iiqrbsEgxZHXXZynrPyJGPVbD3o4xIbov9tchg=s900-c-k-c0xffffffff-no-rj-mo')
                          : Image.network(
                        articles.urlToImage,

                        fit: BoxFit.fill,
                      ),
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      leading: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      elevation: 0, //shadow
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      Text(articles.title == null
                          ? 'Unknown' : articles.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2,
                            wordSpacing: 0.6
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Text(articles.description == null
                          ? 'Unknown' : articles.description,
                        style: TextStyle(
                            color: Colors.cyan[900],
                            fontSize: 16.0,
                            letterSpacing: 0.2,
                            wordSpacing: 0.3
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(articles.author == null
                              ? 'Unknown' : articles.author,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(articles.publishedAt == null
                              ? 'Unknown' : articles.publishedAt,

                              style: TextStyle(
                                color: Colors.black,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],)
        ),
      ),

    );
  }
}



