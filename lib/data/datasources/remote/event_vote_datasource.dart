part of datasource;

abstract class EventVoteDataSource {
  Future<EventVoteModel?> getEventVote(int? eventId);
}

class EventVoteDataSourceImpl implements EventVoteDataSource {

  final DioMethod dio;

  const EventVoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<EventVoteModel?> getEventVote(int? eventId) async {
    Response response = await dio.getMethod(UrlPath.eventVotePath(eventId));
    EventVoteModel? eventVote;

    if(response.statusCode != null && response.statusCode == 200) {
      if((response.data as Map<String, dynamic>).isEmpty){
        throw ServerException(statusCode: 204);
      }

      eventVote = EventVoteModel(
        vote1: response.data['votes']['vote1'],
        vote2: response.data['votes']['vote2'],
      );

      return eventVote;

    } else {
      throw ServerException(statusCode: response.statusCode);
    }
  }

}