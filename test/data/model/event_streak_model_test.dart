import 'dart:convert';

import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/file_names.dart';
import '../../fixtures/fixture_reader.dart';

void main(){

  EventStreakModel eventStreakModel = EventStreakModel(
    type: EventStreakType.general,
    name: 'Name',
    team: 'Team'
  );

  test('Should be subclass of EventStrakEntity',
    () => expect(eventStreakModel, isA<EventStreakEntity>())
  );

  group('fromJson', () {

    test('Should return a valid event streak model from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(eventStreakJson));
      final List<dynamic> eventGeneralList = json['general'];
      final Map<String, dynamic> manipulatedJson = {
        'type': EventStreakType.general
      };

      manipulatedJson.addAll(eventGeneralList[0] as Map<String, dynamic>);

      final result = EventStreakModel.fromJson(manipulatedJson);

      expect(result.runtimeType, EventStreakModel);

    });

    group('general', () {
      test('Should get general event list', (){
        final Map<String, dynamic> json = jsonDecode(readFixture(eventStreakJson));

        final List<dynamic> eventGeneralList = json['general'];

        expect(eventGeneralList.length, greaterThan(0));

        test('Should set for each model event type as general', (){
          final Map<String, dynamic> json = jsonDecode(readFixture(eventStreakJson));
          final List<dynamic> eventGeneralList = json['general'];
          final List<EventStreakModel> generalEventList = [];

          for (var element in eventGeneralList) {
            Map<String, dynamic> manipulatedJson = {
              'type': EventStreakType.general
            };

            manipulatedJson.addAll(element as Map<String, dynamic>);
            generalEventList.add(EventStreakModel.fromJson(manipulatedJson));
          }

          final result = generalEventList[0];

          expect(result.type, EventStreakType.general);
        });
      });
    });

    group('head2head', () {
      test('Should set for each model event type as head2head', () async {

        final Map<String, dynamic> json = jsonDecode(readFixture(eventStreakJson));
        final List<dynamic> eventH2hList = json['head2head'];
        final List<EventStreakModel> h2hEventList = [];

        for (var element in eventH2hList) {
          Map<String, dynamic> manipulatedJson = {
            'type': EventStreakType.h2h
          };

          manipulatedJson.addAll(element as Map<String, dynamic>);
          h2hEventList.add(EventStreakModel.fromJson(manipulatedJson));
        }

        final result = h2hEventList[0];

        expect(result.type, EventStreakType.h2h);

      });
    });
  });

}