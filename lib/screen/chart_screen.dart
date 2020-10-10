import 'package:flutter/material.dart';
import 'package:goldnumber/widget/chart_results.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  String game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CHART"),
        ),
        body: Container(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Put The Game Name"),
                autofocus: true,
              
                onChanged: (value) {
                  game = value;
                },
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chart(game),
                      ));
                },
                child: Text("Submit"),
              )
            ],
          ),
        ));
  }
}
