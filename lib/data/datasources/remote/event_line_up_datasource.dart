part of datasource;

abstract class EventLineUpDataSource {
  Future<Map<String, dynamic>> getLineUp(int? eventId);
}

class EventLineUpDataSourceImpl implements EventLineUpDataSource {

  final DioMethod dio;

  const EventLineUpDataSourceImpl({
    required this.dio,
  });

  @override
  Future<Map<String, dynamic>> getLineUp(int? eventId) async {
    Response response = await dio.getMethod(UrlPath.eventLineUpPath(eventId));
    Map<String, dynamic> lineUp = {};

    if(response.statusCode != null && response.statusCode == 200) {
      if((response.data as Map<String, dynamic>).isEmpty){
        throw ServerException(statusCode: 204);
      }

      lineUp['away'] = LineUpModel.fromJson(jsonDecode(response.data['away']));
      lineUp['home'] = LineUpModel.fromJson(jsonDecode(response.data['home']));
      lineUp['confirmed'] = response.data['confirmed'];

    } else {
      throw ServerException(statusCode: response.statusCode);
    }

    return Future.value(lineUp);

  }


}