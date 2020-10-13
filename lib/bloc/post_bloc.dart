import 'package:goldnumber/model/posts.dart';
import 'package:goldnumber/repository/auth.dart';
import 'package:rxdart/rxdart.dart';


class PostBlocList {
  BehaviorSubject<List<Post>> _subject = BehaviorSubject<List<Post>>();

  getPosts() async {
    List<Post> reaponse = await getPost();
    _subject.sink.add(reaponse);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<Post>> get subject => _subject;
}

final postListBloc = PostBlocList();


