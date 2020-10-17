import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/post_bloc.dart';
import 'package:goldnumber/model/ads.dart';
import 'package:goldnumber/model/posts.dart';
import 'package:google_fonts/google_fonts.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    Ads.createBannerAd()
      ..load()
      ..show();
    Ads.createInterstitialAd()
      ..load()
      ..show();
    postListBloc..getPosts();
  }

  @override
  Widget build(BuildContext context) {
    postListBloc..getPosts();
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
      body: StreamBuilder<List<Post>>(
        stream: postListBloc.subject.stream,
        // ignore: missing_return
        builder: (context, snapshot) {
          return (snapshot.hasData)
              ? ListView.builder(
            padding: EdgeInsets.only(bottom: 100),
            itemBuilder: (context, index) {
                    List<Post> post = snapshot.data.reversed.toList();
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
                                post[index].name,
                                style: TextStyle(
                                    color: Color.fromRGBO(212, 175, 55, 1),
                                    fontSize: 26,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                post[index].number,
                                style: TextStyle(
                                  color: Colors.red,fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
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
                                          color: Colors.white, fontSize: 18),
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
