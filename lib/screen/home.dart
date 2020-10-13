import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/games_bloc.dart';
import 'package:goldnumber/bloc/recent_games_bloc.dart';
import 'package:goldnumber/widget/drwer.dart';
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

  Future<void> _getData() async {
    gameListBloc..getGames();
    recentGameList..getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 48, 58, 1),
      appBar: AppBar(
     
        backgroundColor: Color.fromRGBO(149, 76, 233, 1),
        centerTitle: true,
        title: Text(
          "Guru Satta",
          style: GoogleFonts.abrilFatface(
            fontSize: 29,
            color: Colors.white,
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _getData(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Upcoming Results",
                style: GoogleFonts.abrilFatface(
                  fontSize: 22,
                  color: Color.fromRGBO(212, 175, 55, 1),
                ),
              ),
              RecentGames(),
              Text(
                "Results",
                style: GoogleFonts.abrilFatface(
                  fontSize: 29,
                  color: Color.fromRGBO(212, 175, 55, 1),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(child: GuessNumber()),
            ],
          ),
        ),
      ),
    );
  }
}