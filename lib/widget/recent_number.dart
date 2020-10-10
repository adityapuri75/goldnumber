import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/recent_games_bloc.dart';
import 'package:goldnumber/model/recent_game.dart';

class RecentGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 150,
          child: StreamBuilder<List<RecentGame>>(
              stream: recentGameList.subject.stream,
              builder: (context, snapshot) {
                return (snapshot.hasData)
                    ? GridView.count(
                        crossAxisCount: 1,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(snapshot.data.length, (index) {
                          return Card(
                            color: Color.fromRGBO(30, 39, 48, 1),
                            elevation: 0.2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.data[index].newResult,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data[index].tittle,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.red),
                                ),
                              ],
                            ),
                          );
                        }),
                      )
                    : Center(child: CircularProgressIndicator());
              })),
    );
  }
}
