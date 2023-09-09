import 'dart:convert';

import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/h2h_duel/h2h_duel_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/file_names.dart';
import '../../../fixtures/fixture_reader.dart';

void main(){

  H2hDuelModel tH2hDuel = H2hDuelModel();

  test('Should be subclass of H2hDuelEntity',
    () => expect(tH2hDuel, isA<H2hDuelEntity>())
  );

  group('fromJson', () {

    test('Should return a valid event streak model from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(h2hDuelJson));

      final result = H2hDuelModel.fromJson(json);

      expect(result.runtimeType, H2hDuelModel);

    });

  });
}