library datasource;

import 'package:dio/dio.dart';
import 'package:esports_http_api/esports_http_api.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/data/model/event_streak_model.dart';
import 'package:hive/hive.dart';


part 'datasource_box_name.dart';
part 'remote/event_streak_datasource.dart';
part 'local/event_streak_local_datasource.dart';