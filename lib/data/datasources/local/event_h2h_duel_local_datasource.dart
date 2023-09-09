part of datasource;

abstract class EventH2hDuelLocalDataSource {
  Future<H2hDuelModel> getLastH2hDuel();
  Future<void> cacheH2hDuel(H2hDuelModel h2hDuel);
}

class EventH2hDuelLocalDataSourceImpl implements EventH2hDuelLocalDataSource {

  @override
  Future<void> cacheH2hDuel(H2hDuelModel h2hDuel) async {
    Box h2hBox = Hive.box(DataSourceBoxName.h2hDuelName);
    if(!h2hBox.isOpen){
      h2hBox = await Hive.openBox(DataSourceBoxName.h2hDuelName);
    }

    h2hBox.add(h2hDuel);
  }

  @override
  Future<H2hDuelModel> getLastH2hDuel() async {
    Box h2hBox = Hive.box(DataSourceBoxName.h2hDuelName);

    if (!h2hBox.isOpen) {
      h2hBox = await Hive.openBox(DataSourceBoxName.eventStreakName);
    }

    int lastBoxIndex = h2hBox.length - 1;
    H2hDuelModel? lastH2hDuel = h2hBox.getAt(lastBoxIndex);
    return Future.value(lastH2hDuel);
  }

}