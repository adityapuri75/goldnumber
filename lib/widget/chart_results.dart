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
          centerTitle: true,
          title: Text(widget.name+" Chart"),
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
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Result Date"),
                                        Text(name[index].resultDate)
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Bazar Name"),
                                        Text(name[index].bazarName)
                                      ],
                                    ),
                                    Divider(),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Result"),
                                        Text(name[index].result)
                                      ],
                                    ),
                                    Divider(),

                                  ],
                                ),
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
