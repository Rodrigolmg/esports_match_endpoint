part of datasource;

abstract class EventGameDataSource {
  Future<List<EventGameEntity>> getEventGames(int? eventId);
}

class EventGameDataSourceImpl implements EventGameDataSource {

  final DioMethod dio;

  const EventGameDataSourceImpl({
    required this.dio,
  });

  @override
  Future<List<EventGameEntity>> getEventGames(int? eventId) {
    // TODO: implement getEventGames
    throw UnimplementedError();
  }


}