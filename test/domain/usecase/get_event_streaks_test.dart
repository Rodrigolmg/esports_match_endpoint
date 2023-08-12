import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/domain/entities/event_streak_entity.dart';
import 'package:esports_match_endpoint/domain/repositories/event_streaks_repository.dart';
import 'package:esports_match_endpoint/domain/usecases/get_event_streaks.dart';
import 'package:esports_match_endpoint/core/enums/event_streak_type_enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventStreaksRepository>()])
import 'get_event_streaks_test.mocks.dart';

void main(){

  late GetEventStreaks useCase;
  late MockEventStreaksRepository repository;

  setUp((){
    repository = MockEventStreaksRepository();
    useCase = GetEventStreaks(repository);
  });

  const int eventId = 1;

  const EventStreakEntity event = EventStreakEntity(
    type: EventStreakType.general,
    name: 'General',
    team: 'Team 1',
  );

  const EventStreakEntity event2h2 = EventStreakEntity(
    type: EventStreakType.h2h,
    name: 'Head to Head',
    team: 'Team 2',
  );

  group('Event General type', () {
    test('Should get Right value', () async {

      when(repository.getEventStreaks(any))
          .thenAnswer((_) async => const Right(event));

      final result = await useCase(eventId);

      expect(result, const Right(event));
      verify(repository.getEventStreaks(eventId));
      verifyNoMoreInteractions(repository);
    });

    test('Should be general type', () async {
      when(repository.getEventStreaks(any))
          .thenAnswer((_) async => const Right(event));

      final result = await useCase(eventId);

      expect(result.getOrElse(() => event).type, EventStreakType.general);
      verify(repository.getEventStreaks(eventId));
      verifyNoMoreInteractions(repository);
    });

  });

  group('Event Head 2 Head type', () {
    test('Should get Right value', () async {

      when(repository.getEventStreaks(any))
          .thenAnswer((_) async => const Right(event2h2));

      final result = await useCase(eventId);

      expect(result, const Right(event2h2));
      verify(repository.getEventStreaks(eventId));
      verifyNoMoreInteractions(repository);
    });

    test('Should be head2head type', () async {
      when(repository.getEventStreaks(any))
          .thenAnswer((_) async => const Right(event2h2));

      final result = await useCase(eventId);

      expect(result.getOrElse(() => event2h2).type, EventStreakType.h2h);
      verify(repository.getEventStreaks(eventId));
      verifyNoMoreInteractions(repository);
    });

  });

}