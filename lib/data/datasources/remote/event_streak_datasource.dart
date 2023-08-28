part of datasource;

abstract class EventStreakDataSource {
  Future<EventStreakModel?> getEventStreaks(int? id);
}

class EventStreakDataSourceImpl implements  EventStreakDataSource{

  final DioMethod? dioMethodClient;
  final Dio? dioClient;

  EventStreakDataSourceImpl({this.dioClient, this.dioMethodClient});

  @override
  Future<EventStreakModel?> getEventStreaks(int? id) async {
    Response response = await dioMethodClient!.getMethod(UrlPath.eventStreakPath(id));
    Future<EventStreakModel?> futureEvent;

    if(response.statusCode != null && response.statusCode == 200){

      if((response.data as Map<String, dynamic>).isEmpty){
        throw ServerException(statusCode: 204);
      }

      futureEvent = Future.value(EventStreakModel.fromJson(response.data));

    } else {
      throw ServerException(statusCode: response.statusCode);
    }

    return futureEvent;
  }
}