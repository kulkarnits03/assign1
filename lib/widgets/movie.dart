import 'package:flutter/material.dart';
import 'package:project1/utils/text.dart';
import 'package:project1/widgets/trending.dart';
import 'package:project1/widgets/toprated.dart';
import 'package:project1/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: moviehome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class moviehome extends StatefulWidget {
  const moviehome({Key? key}) : super(key: key);

  @override
  _moviehomeState createState() => _moviehomeState();
}

class _moviehomeState extends State<moviehome> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  final String apikey = 'a1ef70c7fa9c10298dc6a457c8b7011b';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMWVmNzBjN2ZhOWMxMDI5OGRjNmE0NTdjOGI3MDExYiIsInN1YiI6IjYyMGU1ZTk5OTUxMmUxMDA2Y2JhNzZmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oMEREQ2ycF0BmxDKKep2-mMBk83BHHztYJlLNm30Fdo';

  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingresult);
  }

  @override
  Widget build(BuildContext context) {
    var color;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text('Movie Recommendations',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: ListView(
          children: [
            TrendingMovies(
              trending: trendingmovies,
            ),
            TV(tv: tv),
            TopRatedMovies(
              toprated: topratedmovies,
            ),
          ],
        ));
  }
}
