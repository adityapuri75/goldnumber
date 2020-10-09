import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/bloc.dart';
import 'package:goldnumber/model/game_data.dart';
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
                  child: StreamBuilder<List<Game>>(
                      stream: gameListBloc.subject.stream,
                      builder: (context, snapshot) {
                        return GridView.count(
                          crossAxisCount: 1,
                          scrollDirection: Axis.horizontal,
                          children:
                              List.generate(snapshot.data.length, (index) {
                            return GamesCard(index, snapshot.data);
                          }),
                        );
                      }))),
          Expanded(flex: 2, child: GuessNumber()),
        ],
      ),
    );
  }
}
