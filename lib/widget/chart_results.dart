import 'package:flutter/material.dart';
import 'package:goldnumber/model/chart.dart';
import 'package:goldnumber/repository/auth.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
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
        backgroundColor: Color.fromRGBO(36, 48, 58, 1),
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.name+" Chart",style: GoogleFonts.abrilFatface(
            fontSize: 29,
            color: Colors.white,
          ),),
        ),
        body: FutureBuilder<GameChart>(
            future: getChartData(widget.name),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                    padding: EdgeInsets.only(bottom: 60),
                      itemBuilder: (context, index) {
                        List<Datum> game = snapshot.data.data;
                        var name = game;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shadowColor: Color.fromRGBO(149, 76, 233, 1),
                            elevation: 8,
                            color: Color.fromRGBO(30, 39, 48, 1),

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
                                        Text("Result Date",style: TextStyle(color: Color.fromRGBO(212, 175, 55, 1),fontSize: 20),),
                                        Text(name[index].resultDate,style: TextStyle(color: Color.fromRGBO(212, 175, 55, 1),fontSize: 20),),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Bazar Name",style: TextStyle(color: Color.fromRGBO(212, 175, 55, 1),fontSize: 20),),
                                        Text(name[index].bazarName,style: TextStyle(color: Color.fromRGBO(212, 175, 55, 1),fontSize: 20,),)
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Result",style: TextStyle(color: Color.fromRGBO(212, 175, 55, 1),fontSize: 20),),
                                        Text(name[index].result,style: TextStyle(color: Color.fromRGBO(212, 175, 55, 1),fontSize: 20),)
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 0.5,
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: 32,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }));
  }
}