import 'package:flutter/material.dart';
import 'package:goldnumber/model/vip.dart';
import 'package:goldnumber/repository/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class VipScreen extends StatefulWidget {

  @override
  _VipScreenState createState() => _VipScreenState();
}

class _VipScreenState extends State<VipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 48, 58, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Guess Number",
          style: GoogleFonts.abrilFatface(
            fontSize: 29,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<List<Vip>>(
        future:getVipPost(),
        // ignore: missing_return
        builder: (context, snapshot) {
          return (snapshot.hasData)
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    List<Vip> post = snapshot.data.reversed.toList();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shadowColor: Color.fromRGBO(149, 76, 233, 1),
                        elevation: 8,
                        color: Color.fromRGBO(30, 39, 48, 1),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                              child: Column(
                            children: [
                              Image(
                                image: AssetImage('Images/crown.png'),
                                height: 60,
                                width: 150,
                              ),
                              Text(
                                post[index].phone,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 27,fontWeight: FontWeight.bold),
                              ),
                          
                              SizedBox(
                                height: 7,
                              ),
                              (post[index].des == null)
                                  ? Text(
                                      "",
                                    )
                                  : Text(
                                      post[index].des,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                            ],
                          )),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
