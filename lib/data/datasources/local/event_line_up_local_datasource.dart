part of datasource;

abstract class EventLineUpLocalDataSource {
  Future<Map<String, dynamic>> getLastLineUp();
  Future<void> cacheLineUp(Map<String, dynamic> lineUps);
}

class EventLineUpLocalDataSourceImpl implements EventLineUpLocalDataSource {

  @override
  Future<void> cacheLineUp(Map<String, dynamic> lineUps) async {
    Box lineUpBox = Hive.box(DataSourceBoxName.lineUpName);

    if(!lineUpBox.isOpen){
      lineUpBox = await Hive.openBox(DataSourceBoxName.lineUpName);
    }

    lineUpBox.add(lineUps);
  }

  @override
  Future<Map<String, dynamic>> getLastLineUp() async {
    Box lineUpBox = Hive.box(DataSourceBoxName.lineUpName);

    if(!lineUpBox.isOpen){
      lineUpBox = await Hive.openBox(DataSourceBoxName.lineUpName);
    }

    int lastBoxIndex = lineUpBox.length - 1;
    Map<String, dynamic> lastLineUp = lineUpBox.getAt(lastBoxIndex);
    return lastLineUp;

  }



}