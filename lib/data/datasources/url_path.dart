part of datasource;

class UrlPath {
  // Path with params
  static String eventStreakPath(int? id) => 'event/$id/streaks';
  static String matchSchedulePath(int? day, int? month, int? year)
      => 'matches/$day/$month/$year';
  static String eventPath(int? eventId) => 'event/$eventId';
  static String eventLineUpPath(int? eventId) => 'event/$eventId/lineups';

  // Path without params
  static String liveMatchesPath = 'matches/live';
}