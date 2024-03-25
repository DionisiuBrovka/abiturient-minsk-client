class GalleryModel {
  int id;
  String photo;
  String? desc;

  GalleryModel({required this.id, required this.photo, this.desc});

  GalleryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        photo = json['photo'] {
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['desc'] = desc;
    return data;
  }
}
