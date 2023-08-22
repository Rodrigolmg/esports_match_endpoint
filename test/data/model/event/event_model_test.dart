import 'package:esports_match_endpoint/data/model/event/event_model.dart';
import 'package:esports_match_endpoint/domain/entities/event/event_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  late EventModel event;
  const int tEventId = 1;

  setUp(() {
    event = EventModel(id: tEventId);
  });

  test('Should be subclass of EventEntity',
      () => expect(event, isA<EventEntity>())
  );

  group('fromJson', () {

    test('Should return a valid event model from JSON', () async {

    });

  });

}