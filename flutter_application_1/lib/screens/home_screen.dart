import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/theme.dart' as Style;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_application_1/widgets/genres.dart';
import 'package:flutter_application_1/widgets/now_playing.dart';
import 'package:flutter_application_1/widgets/persons.dart';

import '../widgets/top_movies.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen ({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline,color: Colors.white,),
        title:Text("Movie Cool"),
        actions: <Widget>[
          IconButton(onPressed:null, icon: Icon(EvaIcons.searchOutline,color: Colors.white,))
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          GenresScreen(),
          PersonList(),
          TopMovies()
        ],
      ),
    );
  }
}