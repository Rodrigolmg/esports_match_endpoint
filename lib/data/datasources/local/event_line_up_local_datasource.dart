part of datasource;

abstract class EventLineUpLocalDataSource {
  Future<Map<String, LineUpModel>> getLastLineUp();
  Future<void> cacheLineUp(Map<String, LineUpEntity> lineUps);
}

class EventLineUpLocalDataSourceImpl implements EventLineUpLocalDataSource {

  @override
  Future<void> cacheLineUp(Map<String, LineUpEntity> lineUps) async {
    Box lineUpBox = Hive.box(DataSourceBoxName.lineUpName);

    if(!lineUpBox.isOpen){
      lineUpBox = await Hive.openBox(DataSourceBoxName.lineUpName);
    }

    for (var lineUp in lineUps.values) {
      lineUpBox.add(lineUp);
    }
  }

  @override
  Future<Map<String, LineUpModel>> getLastLineUp() {
    // TODO: implement getLastLineUp
    throw UnimplementedError();
  }



}