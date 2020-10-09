import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/games_bloc.dart';
import 'package:goldnumber/model/game_data.dart';

class GuessNumber extends StatefulWidget {
  @override
  _GuessNumberState createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Game>>(
      stream: gameListBloc.subject.stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Game> contact = snapshot.data;
        if (snapshot.hasData) {
          return GridView.count(
          shrinkWrap: true,
                        scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            childAspectRatio: 100 / 70,
            children: List.generate(contact.length, (index) {
              return GamesCard(index, contact);
            }),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class GamesCard extends StatelessWidget {
  final List<Game> contact;
  final int index;
  GamesCard(this.index, this.contact);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.yellow,
            blurRadius: 0.05,
          )
        ]),
        child: Card(
          color: Colors.yellow[200],
          elevation: 0.2,
          child: Column(
            children: [
              Center(
                  child: Text(
                contact[index].tittle,
                maxLines: 1,
                style: TextStyle(fontSize: 25, color: Colors.black),
              )),
              Center(
                  child: Text("(" + contact[index].time + ")",
                      style: TextStyle(fontSize: 12, color: Colors.grey))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("[" + contact[index].oldResult + "]" + " - ",
                        maxLines: 1,
                        style:
                            TextStyle(fontSize: 20, color: Colors.redAccent)),
                    Text(contact[index].newResult,
                        maxLines: 1,
                        style: TextStyle(fontSize: 20, color: Colors.green)),
                  ],
                ),
              ),

//              Center(
//                  child: (contact[index].newResult.isEmpty)
//                      ? Text(
//                          "WAIT...",
//                          style: TextStyle(fontSize: 25, color: Colors.red),
//                        )
//                      : Text("NEW => " + contact[index].newResult,
//                          style: TextStyle(fontSize: 20, color: Colors.green))),
            ],
          ),
        ),
      ),
    );
  }
}
