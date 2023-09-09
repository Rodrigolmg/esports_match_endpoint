
import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/domain/entities/h2h_duel/h2h_duel_entity.dart';
import 'package:esports_match_endpoint/domain/repositories/repository_contract.dart';

class GetEventH2hDuelUseCase implements UseCase<H2hDuelEntity, int?> {

  final EventH2hDuelRepository repository;

  const GetEventH2hDuelUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, H2hDuelEntity>> call([int? eventId]) {
    return repository.getDuel(eventId);
  }


}