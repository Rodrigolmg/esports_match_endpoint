part of datasource;

abstract class EventH2hDuelDataSource {
  Future<H2hDuelModel> getH2hDuel(int? eventId);
}

class EventH2hDuelDataSourceImpl implements EventH2hDuelDataSource {

  final DioMethod dio;

  const EventH2hDuelDataSourceImpl({
    required this.dio,
  });

  @override
  Future<H2hDuelModel> getH2hDuel(int? eventId) async {
    Response response = await dio.getMethod(UrlPath.eventH2hDuelPath(eventId));
    H2hDuelModel? h2h;

    if(response.statusCode != null && response.statusCode == 200) {
      if((response.data as Map<String, dynamic>).isEmpty){
        throw ServerException(statusCode: 204);
      }

      h2h = H2hDuelModel(
        managerDuel: response.data['managerDuel'],
        teamDuel: TeamDuelModel.fromJson(response.data['teamDuel'])
      );

      return h2h;

    } else {
      throw ServerException(statusCode: response.statusCode);
    }
  }


}