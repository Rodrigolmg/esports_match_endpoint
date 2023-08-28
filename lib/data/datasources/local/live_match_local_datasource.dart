part of datasource;

abstract class LiveMatchLocalDataSource {
  Future<List<EventModel>?> getLastLiveMatches();
  Future<void> cacheLiveMatches(List<EventModel>? matches);
}

class LiveMatchLocalDataSourceImpl implements LiveMatchLocalDataSource {

  @override
  Future<void> cacheLiveMatches(List<EventModel>? matches) async {
    Box liveMatchesBox = Hive.box(DataSourceBoxName.liveMatchesName);

    if(!liveMatchesBox.isOpen){
      liveMatchesBox = await Hive.openBox(DataSourceBoxName.liveMatchesName);
    }

    if(matches == null || matches.isEmpty){
      throw CacheException();
    }

    for(EventModel event in matches){
      liveMatchesBox.add(event);
    }
  }

  @override
  Future<List<EventModel>?> getLastLiveMatches() async {
    Box liveMatchesBox = Hive.box(DataSourceBoxName.liveMatchesName);

    if(!liveMatchesBox.isOpen){
      liveMatchesBox = await Hive.openBox(DataSourceBoxName.liveMatchesName);
    }

    List<EventModel>? events;

    if(liveMatchesBox.isNotEmpty){
      events = [];
      for(var event in liveMatchesBox.values){
        events.add(EventModel.fromJson(event));
      }
    }

    return Future.value(events);
  }

}