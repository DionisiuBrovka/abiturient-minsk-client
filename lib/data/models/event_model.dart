class EventModel {
  int id;
  String eDate; //TODO empliment DATE TYPE
  String title;
  String? desc;
  String? prev;
  String? eUrl;

  EventModel({
    required this.id,
    required this.eDate,
    required this.title,
    this.desc,
    this.prev,
    this.eUrl,
  });

  EventModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        eDate = json['e_date'],
        title = json['title'] {
    title = json['title'];
    desc = json['desc'];
    prev = json['prev'];
    eUrl = json['e_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['e_date'] = eDate;
    data['title'] = title;
    data['desc'] = desc;
    data['prev'] = prev;
    data['e_url'] = eUrl;

    return data;
  }
}
