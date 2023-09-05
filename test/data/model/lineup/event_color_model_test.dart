import 'dart:convert';

import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/file_names.dart';
import '../../../fixtures/fixture_reader.dart';

void main(){

  EventColorModel tColor = EventColorModel();

  test('Should be a subclass of EventColorEntity',
    () => expect(tColor, isA<EventColorEntity>())
  );

  group('fromJson', () {

    test('Should return a valid EventColorModel from a JSON', () {

      final Map<String,dynamic> json =  jsonDecode(readFixture(eventColorJson));
      final result = EventColorModel.fromJson(json);

      expect(result, isA<EventColorModel>());

    });

  });

}