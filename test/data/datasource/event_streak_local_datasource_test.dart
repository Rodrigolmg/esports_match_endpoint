import 'package:esports_match_endpoint/data/datasources/local/event_streak_local_datasource.dart';
import 'package:esports_match_endpoint/data/model/event_streak_model.dart';
import 'package:esports_match_endpoint/domain/entities/enums/event_streak_type_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<HiveInterface>(), MockSpec<Box<EventStreakModel>>()])
import 'event_streak_local_datasource_test.mocks.dart';

void main(){
  late EventStreakLocalDataSourceImpl localDataSource;
  late MockHiveInterface mockHive;
  late MockBox mockBox;

  const String tBoxName = 'boxTest';
  const EventStreakModel tEventStreak = EventStreakModel(
      type: EventStreakType.general,
      name: 'Name',
      team: 'Team',
      value: '3',
      continued: false
  );


  setUp(() {
    mockHive = MockHiveInterface();
    mockBox = MockBox();
    localDataSource = EventStreakLocalDataSourceImpl();
  });

  group('getLastEventStreak', () {

    test('Should get the last event streak', () async {
      when(localDataSource.getLastEventStreak())
          .thenAnswer((_) async => tEventStreak);

      mockBox.add(tEventStreak);

      verify(localDataSource.getLastEventStreak());
      expect(mockBox.getAt(0), tEventStreak);
    });
    
  });

}