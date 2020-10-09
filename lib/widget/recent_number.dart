
import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/recent_games_bloc.dart';
import 'package:goldnumber/model/recent_game.dart';

class RecentGames extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: StreamBuilder<List<RecentGame>>(
              stream: recentGameList.subject.stream,
              builder: (context, snapshot) {
                return GridView.count(
                  crossAxisCount: 1,
                  physics: NeverScrollableScrollPhysics(),
                  children:
                  List.generate(snapshot.data.length, (index) {
                    return Center(
                      child: Card(
                        color: Colors.yellow[200],
                        elevation: 0.2,
                        child: Column(
                          children: [
                            Text(
                              snapshot.data[index].tittle,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black),
                            ),
                            Text(
                                "NEW => " +
                                    snapshot.data[index].newResult,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green)),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              })),
    );
  }
}
