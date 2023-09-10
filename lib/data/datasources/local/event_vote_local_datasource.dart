part of datasource;

abstract class EventVoteLocalDataSource {
  Future<EventVoteModel?> getLastEventVote();
  Future<void> cacheEventVote(EventVoteModel? eventVote);
}

class EventVoteLocalDataSourceImpl implements EventVoteLocalDataSource {

  @override
  Future<void> cacheEventVote(EventVoteModel? eventVote) async {
    Box eventVoteBox = Hive.box(DataSourceBoxName.eventVoteName);

    if(!eventVoteBox.isOpen){
      eventVoteBox = await Hive.openBox(DataSourceBoxName.eventVoteName);
    }

    eventVoteBox.add(eventVote);
  }

  @override
  Future<EventVoteModel?> getLastEventVote() async {
    Box eventVoteBox = Hive.box(DataSourceBoxName.eventVoteName);

    if(!eventVoteBox.isOpen){
      eventVoteBox = await Hive.openBox(DataSourceBoxName.eventVoteName);
    }

    int lastBoxIndex = eventVoteBox.length - 1;
    EventVoteModel? eventVote = eventVoteBox.getAt(lastBoxIndex);
    return Future.value(eventVote);
  }

}