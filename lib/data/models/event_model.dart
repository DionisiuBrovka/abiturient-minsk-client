class EventModel {
  int? id;
  String? eDate;
  String? title;
  String? desc;
  Null prev;
  Null eUrl;
  int? org;

  EventModel(
      {this.id,
      this.eDate,
      this.title,
      this.desc,
      this.prev,
      this.eUrl,
      this.org});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eDate = json['e_date'];
    title = json['title'];
    desc = json['desc'];
    prev = json['prev'];
    eUrl = json['e_url'];
    org = json['org'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['e_date'] = eDate;
    data['title'] = title;
    data['desc'] = desc;
    data['prev'] = prev;
    data['e_url'] = eUrl;
    data['org'] = org;
    return data;
  }
}
