part of datasource;

class UrlPath {
  // Path with params
  static String eventStreakPath(int? id) => 'event/$id/streaks';
  static String matchSchedulePath(int? day, int? month, int? year)
      => 'matches/$day/$month/$year';

  // Path without params
  static String liveMatchesPath = 'matches/live';
}