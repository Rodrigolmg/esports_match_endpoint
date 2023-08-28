part of datasource;

abstract class EventDataSource {
  Future<EventModel> getEvent(int? eventId);
}

class EventDataSourceImpl implements EventDataSource {

  final DioMethod? dio;

  const EventDataSourceImpl({
    this.dio,
  });

  @override
  Future<EventModel> getEvent(int? eventId) {
    // TODO: implement getEvent
    throw UnimplementedError();
  }
}