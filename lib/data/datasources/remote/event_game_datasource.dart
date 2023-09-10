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
  Future<List<EventGameEntity>> getEventGames(int? eventId) async {
    Response response = await dio.getMethod(UrlPath.eventGamePath(eventId));
    List<EventGameModel> games = [];

    if(response.statusCode != null && response.statusCode == 200) {
      if((response.data as Map<String, dynamic>).isEmpty){
        throw ServerException(statusCode: 204);
      }

      for (var game in response.data as List<dynamic>) {
        games.add(EventGameModel.fromJson(game));
      }

      return games;

    } else {
      throw ServerException(statusCode: response.statusCode);
    }
  }


}