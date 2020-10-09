import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/games_bloc.dart';
import 'package:goldnumber/bloc/recent_games_bloc.dart';
import 'package:goldnumber/model/game_data.dart';
import 'package:goldnumber/model/recent_game.dart';
import 'package:goldnumber/widget/numbers.dart';
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
          Expanded(
              child: Container(
                  child: StreamBuilder<List<RecentGame>>(
                      stream: recentGameList.subject.stream,
                      builder: (context, snapshot) {
                        return GridView.count(
                          crossAxisCount: 1,
                          scrollDirection: Axis.horizontal,
                          children:
                              List.generate(snapshot.data.length, (index) {
                            return Card(
                              color: Colors.yellow[200],
                              elevation: 0.2,
                              child: Column(
                                children: [
                                  Center(
                                      child: Text(
                                    snapshot.data[index].tittle,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  )),
                                  Center(
                                      child: Text(
                                          "NEW => " +
                                              snapshot.data[index].newResult,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green))),
                                ],
                              ),
                            );
                          }),
                        );
                      }))),
          Expanded(flex: 2, child: GuessNumber()),
        ],
      ),
    );
  }
}
