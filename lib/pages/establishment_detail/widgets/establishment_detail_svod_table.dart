import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/svod_table_model.dart';

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
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  defaultVerticalAlignment:
                      TableCellVerticalAlignment.intrinsicHeight,
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FixedColumnWidth(300),
                    2: FixedColumnWidth(175),
                    3: FixedColumnWidth(200),
                    4: FixedColumnWidth(200),
                    5: FixedColumnWidth(200),
                    6: FixedColumnWidth(200),
                    7: IntrinsicColumnWidth(),
                    8: FixedColumnWidth(200),
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
            title: e.sType == "9" ? "9 класса" : "11 класса",
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
        ]);
  }).toList();
}

class TableRowBodyCellSpecial extends StatelessWidget {
  const TableRowBodyCellSpecial({
    super.key,
    required this.svodTable,
  });

  final SvodTableModel svodTable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            svodTable.skill!.first.title,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class TableRowBodyCell extends StatelessWidget {
  final String title;
  final bool isCenter;
  final bool isBold;
  final Icon? icon;

  const TableRowBodyCell(
      {super.key,
      required this.title,
      this.isCenter = false,
      this.isBold = false,
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
          Text(
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
