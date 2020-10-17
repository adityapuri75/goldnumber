import 'package:flutter/material.dart';
import 'package:goldnumber/widget/chart_results.dart';
import 'package:google_fonts/google_fonts.dart';

class ChartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 48, 58, 1),
      appBar: AppBar(
        title: Text(
          "Monthly Chart",
          style: GoogleFonts.abrilFatface(
            fontSize: 29,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(children: [
        ChartCard("Disawar"),
        ChartCard("Faridabad"),
        ChartCard("Ghaziabad"),
        ChartCard("Gali"),
        SizedBox(height: 60,)
      ]),
    );
  }
}

// ignore: must_be_immutable
class ChartCard extends StatelessWidget {
  String name;
  ChartCard(this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Color.fromRGBO(149, 76, 233, 1),
        elevation: 8,
        color: Color.fromRGBO(30, 39, 48, 1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chart(name),
                )),
            child: Container(
                child: Column(
              children: [
                Image(
                  image: AssetImage('Images/crown.png'),
                  height: 60,
                  width: 150,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Color.fromRGBO(212, 175, 55, 1), fontSize: 25),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
