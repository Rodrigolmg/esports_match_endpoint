import 'dart:convert';

import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/file_names.dart';
import '../../../fixtures/fixture_reader.dart';

void main(){
  GameStatusModel gameStatus = GameStatusModel();

  test('Should be subclass of GameStatusEntity',
    () => expect(gameStatus, isA<GameStatusEntity>())
  );

  group('fromJson', () {
    test('Should return a valid game status model from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(gameStatusJson));
      final result = GameStatusModel.fromJson(json);

      expect(result.runtimeType, GameStatusModel);

    });
  });
}