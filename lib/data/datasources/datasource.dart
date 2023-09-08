library datasource;

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:esports_http_api/esports_http_api.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:esports_match_endpoint/domain/entities/entity.dart';
import 'package:hive/hive.dart';

part 'datasource_box_name.dart';
part 'url_path.dart';

// remote
part 'remote/event_streak_datasource.dart';
part 'remote/live_match_datasource.dart';
part 'remote/event_datasource.dart';
part 'remote/event_line_up_datasource.dart';

// local
part 'local/event_streak_local_datasource.dart';
part 'local/live_match_local_datasource.dart';
part 'local/event_local_datasource.dart';
part 'local/event_line_up_local_datasource.dart';