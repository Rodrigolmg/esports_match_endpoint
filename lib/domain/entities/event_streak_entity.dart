import 'package:equatable/equatable.dart';
import 'package:esports_match_endpoint/domain/entities/enums/event_streak_type_enum.dart';

class EventStreakEntity extends Equatable {
  final EventStreakType type;
  final bool? continued;
  final String? name;
  final String? team;
  final String? value;

  const EventStreakEntity({
    required this.type,
    required this.name,
    required this.team,
    this.continued,
    this.value,
  });

  @override
  List<Object?> get props => [name, team];
}