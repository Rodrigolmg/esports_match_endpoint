library model;

import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:esports_match_endpoint/domain/entities/h2h_duel/h2h_duel_entity.dart';
import 'package:esports_match_endpoint/domain/entities/h2h_duel/team_duel_entity.dart';

// event
part 'event/category_model.dart';
part 'event/change_model.dart';
part 'event/country_model.dart';
part 'event/event_model.dart';
part 'event/sport_model.dart';
part 'event/team_model.dart';
part 'event/tournament_model.dart';

// event streak
part 'event_streak/event_streak_model.dart';

// line up
part 'lineup/line_up_model.dart';
part 'lineup/event_color_model.dart';
part 'lineup/player_model.dart';

// h2h duel
part 'h2h_duel/team_duel_model.dart';
part 'h2h_duel/h2h_duel_model.dart';

// event vote
part 'event_vote/event_vote_model.dart';

// event game
part 'event_game/game_score_model.dart';