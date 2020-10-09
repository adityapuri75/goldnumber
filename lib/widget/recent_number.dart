import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/recent_games_bloc.dart';
import 'package:goldnumber/model/recent_game.dart';

class RecentGames extends StatelessWidget {
  const RecentGames({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<List<RecentGame>>(
            stream: recentGameList.subject.stream,
            builder: (context, snapshot) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.yellow[200],
                      elevation: 0.2,
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data[index].tittle,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black),
                            ),
                            Text(
                              "NEW => " + snapshot.data[index].newResult,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
              );
            }));
  }
}
