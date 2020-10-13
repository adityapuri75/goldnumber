import 'package:flutter/material.dart';
import 'package:goldnumber/bloc/post_bloc.dart';
import 'package:goldnumber/model/posts.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    postListBloc..getPosts();
  }

  @override
  Widget build(BuildContext context) {
    postListBloc..getPosts();
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<Post>>(
        stream: postListBloc.subject.stream,
        // ignore: missing_return
        builder: (context, snapshot) {
          return (snapshot.hasData)
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    List<Post> post = snapshot.data;
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
                              Text(
                                post[index].name,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                snapshot.data[index].number,
                                style: TextStyle(color: Colors.white),
                              ),
                              (post[index].des == null)
                                  ? Text(
                                      "xx",
                                    )
                                  : Text(
                                      post[index].des,
                                      style: TextStyle(color: Colors.white),
                                    ),
                              (post[index].image != null)
                                  ? Image.network(
                                      post[index].image,
                                    )
                                  : Text(
                                      "xx",
                                    )
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
