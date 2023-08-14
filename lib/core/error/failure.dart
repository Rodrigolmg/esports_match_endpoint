import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<dynamic>? properties;

  const Failure({
    this.properties,
  });
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}