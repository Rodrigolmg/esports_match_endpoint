part of model;

class EventVoteModel extends EventVoteEntity {

  EventVoteModel({
    int? vote1,
    int? vote2,
  }) : super (
    vote1: vote1,
    vote2: vote2
  );

  factory EventVoteModel.fromJson(Map<String, dynamic> json) {
    EventVoteModel eventVote = EventVoteModel(
      vote1: json['vote']['vote1'],
      vote2: json['vote']['vote2']
    );

    return eventVote;
  }
}