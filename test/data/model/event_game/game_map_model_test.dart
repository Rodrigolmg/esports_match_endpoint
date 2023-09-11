import 'dart:convert';

import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/file_names.dart';
import '../../../fixtures/fixture_reader.dart';

void main(){
  GameMapModel gameMapModel = GameMapModel(
    id: 1,
    name: "map"
  );

  test('Should be subclass of GameScoreEntity',
      () => expect(gameMapModel, isA<GameMapEntity>())
  );

  group('fromJson', () {
    test('Should return a valid game map model from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(gameMapJson));
      final result = GameMapModel.fromJson(json);

      expect(result.runtimeType, GameMapModel);

    });
  });
}