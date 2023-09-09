import 'dart:convert';

import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/h2h_duel/team_duel_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/file_names.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {

  TeamDuelModel tTeamModel = TeamDuelModel(
    draws: 0,
    awayWins: 2,
    homeWins: 3
  );

  test('Should be subclass of TeamDuelEntity',
      () => expect(tTeamModel, isA<TeamDuelEntity>())
  );

  group('fromJson', () {

    test('Should return a valid event streak model from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(teamDuelJson));

      final result = TeamDuelModel.fromJson(json);

      expect(result.runtimeType, TeamDuelModel);

    });

  });
}