part of entity;

@HiveType(typeId: 19)
class GameStatusEntity extends HiveObject {

  final int? code;
  final String? description;
  final String? type;

  GameStatusEntity({
    this.code,
    this.description,
    this.type,
  });
}