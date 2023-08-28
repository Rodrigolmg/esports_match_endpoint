import 'package:esports_match_endpoint/domain/repositories/repository_contract.dart';
import 'package:esports_match_endpoint/domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<EventLineUpRepository>()])
import 'get_event_line_ups_test.mocks.dart';

void main(){

  late GetLineUpsUseCase useCase;
  late MockEventLineUpRepository mockRepository;

  setUp((){
    mockRepository = MockEventLineUpRepository();
    useCase = GetLineUpsUseCase(repository: mockRepository);
  });
}