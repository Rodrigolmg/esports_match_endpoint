import 'dart:convert';

import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/file_names.dart';
import '../../../fixtures/fixture_reader.dart';

void main(){

  EventGameModel eventGame = EventGameModel(
    id: 1
  );

  test('Should be subclass of GameScoreEntity',
    () => expect(eventGame, isA<EventGameEntity>())
  );

  group('fromJson', () {
    test('Should return a valid game map model from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(eventGameJson));
      final result = EventGameModel.fromJson(json);

      expect(result.runtimeType, EventGameModel);

    });

    test('Should contain a valid id', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(eventGameJson));
      final result = EventGameModel.fromJson(json);

      expect(result.id, isNotNull);

    });
  });
}