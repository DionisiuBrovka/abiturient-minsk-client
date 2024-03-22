import 'package:flutter_eduapp_new/data/models/skill_model.dart';
import 'package:flutter_eduapp_new/data/models/svod_table.dart';

import 'event_model.dart';
import 'gallery_model.dart';

//TODO: implement coords field

class EstablishmentModel {
  int id;
  List<EventModel>? eventsList;
  List<GalleryModel>? gallerysList;
  List<SvodTable>? svodSkillsList;
  String? title;
  String? shortTitle;
  String? desc;
  String? adress;
  String? tel;
  String? email;
  String? wsite;
  String? wtel;
  String? wvk;
  String? winsta;
  String? wface;
  String? wtwit;
  String? wtic;
  String? wother;
  String? icon;
  String? prev;
  String? promoMedio;
  String? coords;

  EstablishmentModel(
      {required this.id,
      this.eventsList,
      this.gallerysList,
      this.svodSkillsList,
      this.title,
      this.shortTitle,
      this.desc,
      this.adress,
      this.tel,
      this.email,
      this.wsite,
      this.wtel,
      this.wvk,
      this.winsta,
      this.wface,
      this.wtwit,
      this.wtic,
      this.wother,
      this.icon,
      this.prev,
      this.promoMedio,
      this.coords});

  EstablishmentModel.fromJson(Map<String, dynamic> json) : id = json['id'] {
    if (json['events'] != null) {
      eventsList = <EventModel>[];
      json['events'].forEach((v) {
        eventsList!.add(EventModel.fromJson(v));
      });
    }
    if (json['gallery'] != null) {
      gallerysList = <GalleryModel>[];
      json['gallery'].forEach((v) {
        gallerysList!.add(GalleryModel.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      svodSkillsList = <SvodTable>[];
      json['skills'].forEach((v) {
        svodSkillsList!.add(SvodTable.fromJson(v));
      });
    }
    title = json['title'];
    shortTitle = json['short_title'];
    desc = json['desc'];
    adress = json['adress'];
    tel = json['tel'];
    email = json['email'];
    wsite = json['wsite'];
    wtel = json['wtel'];
    wvk = json['wvk'];
    winsta = json['winsta'];
    wface = json['wface'];
    wtwit = json['wtwit'];
    wtic = json['wtic'];
    wother = json['wother'];
    icon = json['icon'];
    prev = json['prev'];
    promoMedio = json['promo_medio'];
    coords = json['coords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (eventsList != null) {
      data['events'] = eventsList!.map((v) => v.toJson()).toList();
    }
    if (gallerysList != null) {
      data['gallery'] = gallerysList!.map((v) => v.toJson()).toList();
    }
    if (svodSkillsList != null) {
      data['skills'] = svodSkillsList!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['short_title'] = shortTitle;
    data['desc'] = desc;
    data['adress'] = adress;
    data['tel'] = tel;
    data['email'] = email;
    data['wsite'] = wsite;
    data['wtel'] = wtel;
    data['wvk'] = wvk;
    data['winsta'] = winsta;
    data['wface'] = wface;
    data['wtwit'] = wtwit;
    data['wtic'] = wtic;
    data['wother'] = wother;
    data['icon'] = icon;
    data['prev'] = prev;
    data['promo_medio'] = promoMedio;
    data['coords'] = coords;
    return data;
  }
}
