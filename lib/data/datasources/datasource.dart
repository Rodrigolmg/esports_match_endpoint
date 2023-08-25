library datasource;

import 'package:dio/dio.dart';
import 'package:esports_http_api/esports_http_api.dart';
import 'package:esports_match_endpoint/core/core.dart';
import 'package:esports_match_endpoint/data/model/model.dart';
import 'package:hive/hive.dart';

part 'datasource_box_name.dart';
part 'url_path.dart';
part 'remote/event_streak_datasource.dart';
part 'remote/live_match_datasource.dart';
part 'local/event_streak_local_datasource.dart';
part 'local/live_match_local_datasource.dart';