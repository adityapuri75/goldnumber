import 'package:flutter/material.dart';
import 'package:goldnumber/model/vip.dart';
import 'package:goldnumber/repository/auth.dart';

class VipEditScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Post"),
      ),
      body: FutureBuilder<List<Vip>>(
        future: getVipPost(),
        // ignore: missing_return
        builder: (context, snapshot) {
          return (snapshot.hasData)
              ? ListView.builder(
            itemBuilder: (context, index) {
              List<Vip> post = snapshot.data;
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(

                              post[index].phone,
                              style: TextStyle(color: Colors.white),
                            ),

                            (post[index].des == null)
                                ? Text(
                              "xx",
                            )
                                : Text(
                              post[index].des,
                              style: TextStyle(
                                  color: Colors.white),
                            ),

                            IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  vipDeletePost(post[index].id);

                                })
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