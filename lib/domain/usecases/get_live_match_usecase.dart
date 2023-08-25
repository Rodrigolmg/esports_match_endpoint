import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/domain/entities/event/event_entity.dart';
import 'package:esports_match_endpoint/domain/repositories/repository_contract.dart';

class GetLiveMatchUseCase implements UseCase<List<dynamic>?, dynamic> {

  final LiveMatchRepository repository;

  GetLiveMatchUseCase(this.repository);

  @override
  Future<Either<Failure, List<dynamic>?>> call([params]) async {
    return await repository.getLiveMatches();
  }





}