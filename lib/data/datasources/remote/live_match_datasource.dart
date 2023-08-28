part of datasource;

abstract class LiveMatchDataSource {
  Future<List<EventModel>?> getLiveMatches();
}

class LiveMatchDataSourceImpl implements LiveMatchDataSource {

  final DioMethod dio;

  const LiveMatchDataSourceImpl({
    required this.dio,
  });

  @override
  Future<List<EventModel>?> getLiveMatches() async {
    Response response = await dio.getMethod(UrlPath.liveMatchesPath);
    List<dynamic>? eventsJson;
    List<EventModel>? events;

    if(response.statusCode != null && response.statusCode == 200){

      if(response.data == null || (response.data as Map<String, dynamic>).isEmpty){
        throw ServerException(statusCode: 204);
      }

      eventsJson = (response.data as Map<String, dynamic>)['events'];

      if(eventsJson == null || eventsJson.isEmpty){
        throw ServerException(statusCode: 204);
      }
      events = [];

      for(var event in eventsJson) {
        events.add(EventModel.fromJson(event as Map<String, dynamic>));
      }

    } else {
      throw ServerException(statusCode: response.statusCode);
    }

    return Future.value(events);
  }
}