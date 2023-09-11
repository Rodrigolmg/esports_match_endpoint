import 'dart:convert';

import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/file_names.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  GameScoreModel gameScoreModel = GameScoreModel(
    display: 1,
    period1: 1,
    period2: 2
  );

  test('Should be subclass of GameScoreEntity',
    () => expect(gameScoreModel, isA<GameScoreEntity>())
  );

  group('fromJson', () {
    test('Should return a valid event streak model from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(gameScoreJson));
      final result = GameScoreModel.fromJson(json);

      expect(result.runtimeType, GameScoreModel);

    });
  });

}