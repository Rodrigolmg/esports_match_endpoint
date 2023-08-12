import 'dart:convert';

import 'package:esports_match_endpoint/core/enums/event_streak_type_enum.dart';
import 'package:esports_match_endpoint/data/model/event_streak_model.dart';
import 'package:esports_match_endpoint/domain/entities/event_streak_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/file_names.dart';
import '../../fixtures/fixture_reader.dart';

void main(){

  const eventStreakModel = EventStreakModel(
    type: EventStreakType.general,
    name: 'Name',
    team: 'Team'
  );

  test('Should be subclass of EventStrakEntity',
    () => expect(eventStreakModel, isA<EventStreakEntity>())
  );

  group('fromJson', () {
    test('Should return a valid event model from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(eventStreakJson));

      final result = EventStreakModel.fromJson(json);

      expect(result.runtimeType, isA<EventStreakModel>());

    });

    test('Should return a valid event model from JSON with event type as general', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(eventStreakJson));

      final result = EventStreakModel.fromJson(json);

      expect(result.type, EventStreakType.general);

    });

    test('Should return a valid event model from JSON with event type as head2head', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(eventStreakJson));

      final result = EventStreakModel.fromJson(json);

      expect(result.type, EventStreakType.h2h);

    });
  });
}