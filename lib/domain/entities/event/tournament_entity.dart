import 'package:esports_match_endpoint/domain/entities/event/category_entity.dart';
import 'package:esports_match_endpoint/domain/entities/event/sport_entity.dart';

class TournamentEntity {
  final CategoryEntity? category;
  final int? competitionType;
  final int id;
  final String? name;
  final int? priority;
  final String? slug;
  final SportEntity? sport;

  const TournamentEntity({
    this.category,
    this.competitionType,
    required this.id,
    this.name,
    this.priority,
    this.slug,
    this.sport
  });
}

