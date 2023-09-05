part of datasource;

abstract class EventLineUpDataSource {
  Future<Map<String, LineUpModel>> getLineUp(int? eventId);
}

class EventLineUpDataSourceImpl implements EventLineUpDataSource {

  final DioMethod dio;

  const EventLineUpDataSourceImpl({
    required this.dio,
  });

  @override
  Future<Map<String, LineUpModel>> getLineUp(int? eventId) {
    // TODO: implement getLineUp
    throw UnimplementedError();
  }


}