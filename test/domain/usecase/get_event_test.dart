import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:esports_match_endpoint/domain/repositories/repository_contract.dart';
import 'package:esports_match_endpoint/domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventRepository>()])
import 'get_event_test.mocks.dart';


void main(){

  late GetEventUseCase useCase;
  late MockEventRepository mockRepository;

  setUp(() {
    mockRepository = MockEventRepository();
    useCase = GetEventUseCase(repository: mockRepository);
  });

  EventEntity tEvent = EventEntity(id: 1);
  const int tEventId = 1;

  test('Should get Right value', () async {

    when(mockRepository.getEvent(any))
        .thenAnswer((_) async => Right(tEvent));

    final result = await useCase(tEventId);

    expect(result, Right(tEvent));
    verify(mockRepository.getEvent(tEventId));
    verifyNoMoreInteractions(mockRepository);
  });

}