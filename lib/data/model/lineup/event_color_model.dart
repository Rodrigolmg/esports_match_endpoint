part of model;

class EventColorModel extends EventColorEntity {

  EventColorModel({
    String? fancyNumber,
    String? number,
    String? outline,
    String? primary,
  }) : super(
    fancyNumber: fancyNumber,
    number: number,
    outline: outline,
    primary: primary
  );

  factory EventColorModel.fromJson(Map<String, dynamic> json) {

    EventColorModel color = EventColorModel(
      fancyNumber: json['fancyNumber'],
      number: json['number'],
      outline: json['outline'],
      primary: json['primary']
    );

    return color;
  }
}