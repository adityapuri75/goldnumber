import 'package:flutter/material.dart';
import 'package:goldnumber/model/chart.dart';
import 'package:goldnumber/repository/auth.dart';

class Chart extends StatefulWidget {
  String name;
  Chart(this.name);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: FutureBuilder<GameChart>(
            future: getChartData(widget.name),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        List<Datum> game = snapshot.data.data;
                        var name = game;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Container(
                              height: 150,
                              child: Column(
                                children: [
                                  Row(
                                    children: [Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(name[index].bazarName),
                                    ),Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(name[index].resultDate),
                                    ),Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(name[index].result),
                                    )],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data.data.length,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }));
  }
}
