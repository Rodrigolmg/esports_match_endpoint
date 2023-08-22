import 'package:esports_match_endpoint/domain/entities/event/change_entity.dart';

class ChangeModel extends ChangeEntity {

  ChangeModel({
    int? changeTimestamp,
    List<String>? changes
  }) : super(
    changes: changes,
    changeTimestamp: changeTimestamp
  );

  factory ChangeModel.fromJson(Map<String, dynamic> json) {

    ChangeModel change = ChangeModel(
      changeTimestamp: json['changeTimestamp'],
      changes: json['changes']
    );

    return change;
  }

}