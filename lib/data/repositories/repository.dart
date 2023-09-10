library repository;

import 'package:dartz/dartz.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/data/datasources/datasource.dart';
import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:esports_match_endpoint/domain/entities/h2h_duel/h2h_duel_entity.dart';
import 'package:esports_match_endpoint/domain/repositories/repository_contract.dart';


part 'event_streaks_repository_impl.dart';
part 'live_match_repository_impl.dart';
part 'event_repository_impl.dart';
part 'event_line_up_repository_impl.dart';
part 'event_h2h_duel_repository_impl.dart';
part 'event_vote_repository_impl.dart';