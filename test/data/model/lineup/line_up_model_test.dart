import 'dart:convert';

import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/file_names.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {

  LineUpModel tLineUpAway = LineUpModel(
    type: LineUpType.away
  );

  test('Should be subclass of LineUpEntity',
    () => expect(tLineUpAway, isA<LineUpEntity>())
  );

  group('fromJson', () {

    test('Should return a valid LineUpModel away type from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(lineUpAwayJson));
      final result = LineUpModel.fromJson(json);

      expect(result.type, LineUpType.away);

    });

    test('Should return a valid LineUpModel home type from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(lineUpHomeJson));
      final result = LineUpModel.fromJson(json);

      expect(result.type, LineUpType.home);

    });

  });

}