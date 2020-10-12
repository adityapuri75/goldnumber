
import 'package:goldnumber/model/recent_game.dart';
import 'package:goldnumber/repository/auth.dart';
import 'package:rxdart/rxdart.dart';


class RecentGamesList {
  BehaviorSubject<List<RecentGame>> _subject = BehaviorSubject<List<RecentGame>>();

  getGames() async {
    List<RecentGame> reaponse = await getRecentData();
    _subject.sink.add(reaponse);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<RecentGame>> get subject => _subject;
}

final recentGameList = RecentGamesList();
