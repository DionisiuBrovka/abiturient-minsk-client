class FAQModel {
  int? id;
  String? question;
  String? anser;
  bool isExpanded;

  FAQModel({this.id, this.question, this.anser, this.isExpanded = false});

  FAQModel.fromJson(Map<String, dynamic> json) : isExpanded = false {
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
