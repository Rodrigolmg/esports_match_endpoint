import 'dart:convert';

import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/file_names.dart';
import '../../../fixtures/fixture_reader.dart';

void main(){
  EventVoteModel tEventVote = EventVoteModel();

  test('Should be a subclass of EventVoteEntity',
    () => expect(tEventVote, isA<EventVoteEntity>())
  );

  group('fromJson', () {

    test('Should return a valid event streak model from JSON', () async {

      final Map<String, dynamic> json = jsonDecode(readFixture(eventVoteJson));

      final result = EventVoteModel.fromJson(json);

      expect(result.runtimeType, EventVoteModel);

    });

  });
}