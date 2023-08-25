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

    }
  }

  @override
  Future<List<EventModel>?> getLastLiveMatches() {
    // TODO: implement getLastLiveMatches
    throw UnimplementedError();
  }

}