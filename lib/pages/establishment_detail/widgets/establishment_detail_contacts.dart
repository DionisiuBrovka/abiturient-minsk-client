import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/establishment_model.dart';
import 'package:flutter_eduapp_new/pages/establishment_detail/widgets/establishments_contact.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EstablishmentDetailContacts extends StatelessWidget {
  final EstablishmentModel establishment;

  const EstablishmentDetailContacts({super.key, required this.establishment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Контакты",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Divider(),
          ContactGrid(establishment: establishment)
        ],
      ),
    );
  }
}

class ContactGrid extends StatelessWidget {
  const ContactGrid({
    super.key,
    required this.establishment,
  });

  final EstablishmentModel establishment;

  @override
  Widget build(BuildContext context) {
    var children = [
      establishment.tel != null
          ? Contact(
              icon: Icons.phone,
              title: "Телефон",
              uri: Uri.parse(
                "tel:${establishment.tel!}",
              ))
          : null,
      establishment.email != null
          ? Contact(
              icon: Icons.email,
              title: "Электронная почта",
              uri: Uri.parse(
                "mailto:${establishment.email!}",
              ))
          : null,
      establishment.wsite != null
          ? Contact(
              icon: Icons.north_east,
              title: "Веб-сайт",
              uri: Uri.parse(
                establishment.wsite!,
              ))
          : null,
      establishment.wtel != null
          ? Contact(
              icon: Icons.telegram_outlined,
              title: "Телеграмм",
              uri: Uri.parse(
                establishment.wtel!,
              ))
          : null,
      establishment.wvk != null
          ? Contact(
              icon: FontAwesomeIcons.vk,
              title: "Вконтакте",
              uri: Uri.parse(
                establishment.wvk!,
              ))
          : null,
      establishment.winsta != null
          ? Contact(
              icon: FontAwesomeIcons.instagram,
              title: "Инстаграм",
              uri: Uri.parse(
                establishment.winsta!,
              ))
          : null,
      establishment.wface != null
          ? Contact(
              icon: FontAwesomeIcons.facebook,
              title: "Фейсбук",
              uri: Uri.parse(
                establishment.wface!,
              ))
          : null,
      establishment.wtwit != null
          ? Contact(
              icon: FontAwesomeIcons.xTwitter,
              title: "Твиттер",
              uri: Uri.parse(
                establishment.wtwit!,
              ))
          : null,
      establishment.wtic != null
          ? Contact(
              icon: FontAwesomeIcons.tiktok,
              title: "Тик-ток",
              uri: Uri.parse(
                establishment.wtic!,
              ))
          : null,
      establishment.wother != null
          ? Contact(
              icon: Icons.more_horiz,
              title: "Другое",
              uri: Uri.parse(
                establishment.wother!,
              ))
          : null,
    ];

    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: 2,
      crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 4 : 2,
      controller: ScrollController(keepScrollOffset: false),
      children: children.nonNulls.toList(),
    );
  }
}
