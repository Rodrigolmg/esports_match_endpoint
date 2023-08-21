import 'package:esports_match_endpoint/data/model/event_streak_model.dart';
import 'package:esports_match_endpoint/domain/entities/enums/event_streak_type_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<HiveInterface>(), MockSpec<Box<EventStreakModel>>()])
import 'event_streak_local_datasource_test.mocks.dart';

void main(){
  late MockHiveInterface mockHive;
  late MockBox mockBox;

  const String tBoxName = 'boxTest';
  EventStreakModel tEventStreak = EventStreakModel(
      type: EventStreakType.general,
      name: 'Name',
      team: 'Team',
      value: '3',
      continued: false
  );


  setUp(() {
    mockHive = MockHiveInterface();
    mockHive.init('testPath');
    mockBox = MockBox();
    mockBox.add(tEventStreak);
  });

  group('getLastEventStreak', () {

    test('Should get the last event streak', () async {

      when(mockHive.box<EventStreakModel>(tBoxName))
        .thenAnswer((_) => mockBox);

      int lastIndex = mockBox.length - 1;
      final result = mockBox.getAt(lastIndex);

      expect(result, tEventStreak);
    });
    
  });

  tearDown(() {
    mockBox.close();
    mockHive.close();
  });
}