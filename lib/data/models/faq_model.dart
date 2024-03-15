class FAQModel {
  int? id;
  String? question;
  String? anser;

  FAQModel({this.id, this.question, this.anser});

  FAQModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['q'];
    anser = json['a'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['q'] = question;
    data['a'] = anser;
    return data;
  }
}