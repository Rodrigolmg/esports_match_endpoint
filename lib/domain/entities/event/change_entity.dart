part of entity;

@HiveType(typeId: 4)
class ChangeEntity extends HiveObject{

  @HiveField(0)
  final int? changeTimestamp;

  @HiveField(1)
  final List<String>? changes;

  ChangeEntity({
    this.changeTimestamp,
    this.changes,
  });
}