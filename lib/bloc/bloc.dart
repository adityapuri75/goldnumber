import 'package:goldnumber/model/game_data.dart';
import 'package:goldnumber/repository/auth.dart';
import 'package:rxdart/rxdart.dart';


class GameBlocList {
  BehaviorSubject<List<Game>> _subject = BehaviorSubject<List<Game>>();

  getGames() async {
    List<Game> reaponse = await getData();
    _subject.sink.add(reaponse);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<Game>> get subject => _subject;
}

final gameListBloc = GameBlocList();
