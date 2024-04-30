import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eduapp_new/data/models/svod_table_model.dart';
import 'package:flutter_eduapp_new/pages/skill_detail/page_skill_detail.dart';

class EstablishmentDetailSvodTable extends StatelessWidget {
  final List<SvodTableModel> svodTable;

  const EstablishmentDetailSvodTable({super.key, required this.svodTable});

  @override
  Widget build(BuildContext context) {
    if (svodTable.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "План набора на 2024/2025",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Card(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info_sharp,
                    size: 40,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      "Для горизантального перемещение по таблице используйте сочитание клавиш Shift + колесико мышки или курсор",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  defaultVerticalAlignment:
                      TableCellVerticalAlignment.intrinsicHeight,
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FixedColumnWidth(425),
                    2: FixedColumnWidth(175),
                    3: FixedColumnWidth(200),
                    4: FixedColumnWidth(200),
                    5: FixedColumnWidth(200),
                    6: FixedColumnWidth(200),
                    7: FixedColumnWidth(200),
                    8: FixedColumnWidth(200),
                    9: IntrinsicColumnWidth(),
                  },
                  border: TableBorder.all(
                      width: 1, color: const Color.fromARGB(50, 0, 0, 0)),
                  children: generateSvodTableHead() +
                      generateSvodTableRows(svodTable),
                ),
              )),
        ],
      );
    } else {
      return const Center();
    }
  }
}

List<TableRow> generateSvodTableHead() {
  return [
    const TableRow(
        decoration: BoxDecoration(color: Color.fromARGB(255, 41, 83, 199)),
        children: [
          TableRowHeadCell(
            title: "№",
          ),
          TableRowHeadCell(title: "Квалификации"),
          TableRowHeadCell(title: "На базе"),
          TableRowHeadCell(title: "Количество набора бюджет"),
          TableRowHeadCell(title: "Проходной балл бюджет"),
          TableRowHeadCell(title: "Количество набора платное"),
          TableRowHeadCell(title: "Проходной балл платное"),
          TableRowHeadCell(title: "Правила приема"),
          TableRowHeadCell(title: "Ведется ли набор лиц с ОПФР"),
          TableRowHeadCell(title: "Правила набора лиц с ОПФР"),
        ])
  ];
}

class TableRowHeadCell extends StatelessWidget {
  final String title;

  const TableRowHeadCell({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}

List<TableRow> generateSvodTableRows(List<SvodTableModel> svodTable) {
  return svodTable.asMap().entries.map((entry) {
    SvodTableModel e = entry.value;
    return TableRow(
        decoration: BoxDecoration(
            color: entry.key.isEven
                ? const Color.fromARGB(6, 0, 0, 0)
                : Colors.white),
        children: [
          TableRowBodyCell(
            title: (entry.key + 1).toString(),
          ),
          TableRowBodyCellSpecial(svodTable: e),
          TableRowBodyCell(
            isExpanded: true,
            title: baseTitle(e.sType),
          ),
          TableRowBodyCell(
            title: e.bCount?.toString() ?? "---",
            isCenter: true,
            isBold: true,
          ),
          TableRowBodyCell(
            title: e.bAvd?.toString() ?? "---",
            isCenter: true,
            isBold: true,
          ),
          TableRowBodyCell(
            title: e.pCount?.toString() ?? "---",
            isCenter: true,
            isBold: true,
          ),
          TableRowBodyCell(
            title: e.pAvd?.toString() ?? "---",
            isCenter: true,
            isBold: true,
          ),
          TableRowBodyCell(
            isExpanded: true,
            title: e.rule ?? "не указано ",
          ),
          TableRowBodyCell(
            title: e.isOpfr! ? "Да" : "Нет",
            isCenter: true,
            icon: e.isOpfr!
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green[400],
                  )
                : Icon(
                    Icons.cancel,
                    color: Colors.red[400],
                  ),
          ),
          TableRowBodyCell(
            title: e.opfrQnic ?? "---",
          ),
        ]);
  }).toList();
}

String baseTitle(String base) {
  String result;
  switch (base) {
    case "9":
      result = "На основе общего базового образования (после 9 кл.)";
      break;

    case "11":
      result = "На основе общего среднего образования (после 11 кл.)";
      break;

    case "ПТО":
      result = "На основе ПТО";
      break;

    case "Спец":
      result = "На основе специального образования";
      break;

    default:
      result = "---";
  }
  return result;
}

class TableRowBodyCellSpecial extends StatelessWidget {
  const TableRowBodyCellSpecial({
    super.key,
    required this.svodTable,
  });

  final SvodTableModel svodTable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: svodTable.skill!.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 2,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              hoverColor: const Color.fromARGB(255, 207, 226, 255),
              focusColor: const Color.fromARGB(255, 176, 207, 255),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PageSkillDetail(
                        id: e.id,
                      ))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            e.title,
                            style: const TextStyle(fontSize: 14)
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Divider(),
                          Text(e.specialty.title,
                              style: Theme.of(context).textTheme.labelLarge),
                          Text(e.code)
                        ],
                      ),
                    ),
                    Text(e.specialty.cType),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class TableRowBodyCell extends StatelessWidget {
  final String title;
  final bool isCenter;
  final bool isBold;
  final bool isExpanded;
  final Icon? icon;

  const TableRowBodyCell(
      {super.key,
      required this.title,
      this.isCenter = false,
      this.isBold = false,
      this.isExpanded = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment:
            isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment:
            isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          isExpanded
              ? Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight:
                            isBold ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14),
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                      fontSize: 14),
                ),
          const SizedBox(
            width: 4,
          ),
          icon
        ].nonNulls.toList(),
      ),
    );
  }
}
