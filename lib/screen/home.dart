import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/games_bloc.dart';
import 'package:goldnumber/bloc/recent_games_bloc.dart';
import 'package:goldnumber/repository/auth.dart';
import 'package:goldnumber/screen/chart_screen.dart';
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
        actions: [
          IconButton(
              icon: Icon(Icons.show_chart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChartScreen(),
                    ));
              })
        ],
        backgroundColor: Color.fromRGBO(149, 76, 233, 1),
        centerTitle: true,
        title: Text(
          "Gold Satta",
          style: GoogleFonts.lacquer(
            fontSize: 25,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _getData(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Recent Result",
                style: TextStyle(fontSize: 25),
              ),
              Expanded(child: RecentGames()),
              Text(
                "Result",
                style: GoogleFonts.abrilFatface(
                  fontSize: 29,
                  color: Color.fromRGBO(212, 175, 55, 1),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(flex: 2, child: GuessNumber()),
            ],
          ),
        ),
      ),
    );
  }
}
