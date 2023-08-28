part of entity;

@HiveType(typeId: 10)
enum LineUpType {
  away('away'), home('home');

  final String type;
  const LineUpType(this.type);
}