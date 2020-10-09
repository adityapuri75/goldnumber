import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/games_bloc.dart';
import 'package:goldnumber/bloc/recent_games_bloc.dart';
import 'package:goldnumber/widget/numbers.dart';
import 'package:goldnumber/widget/recent_number.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    gameListBloc..getGames();
    recentGameList..getGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Satta",
          style: GoogleFonts.lacquer(
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text("Recent Result",style: TextStyle(
            fontSize: 25
          ),),
          Expanded(
              child: RecentGames()),
              Text("Result",style: GoogleFonts.abrilFatface(
                fontSize: 29
              ),),
          Expanded(flex: 2, child: GuessNumber()),
        ],
      ),
    );
  }
}

