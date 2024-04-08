import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/faq_model.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class FAQViewholder extends StatefulWidget {
  final List<FAQModel> faqList;

  const FAQViewholder({super.key, required this.faqList});

  @override
  State<FAQViewholder> createState() => _FAQViewholderState();
}

class _FAQViewholderState extends State<FAQViewholder> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      ExpansionPanelList(
        elevation: 4,
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            widget.faqList[panelIndex].isExpanded = isExpanded;
          });
        },
        children: widget.faqList
            .map<ExpansionPanel>((FAQModel faqItem) => ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      faqItem.question ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  );
                },
                canTapOnHeader: true,
                body: Column(
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MarkdownBody(
                          data: faqItem.anser ?? '',
                          styleSheet: MarkdownStyleSheet(
                            textAlign: WrapAlignment.spaceBetween,
                            orderedListAlign: WrapAlignment.spaceBetween,
                            unorderedListAlign: WrapAlignment.spaceBetween,
                            p: const TextStyle(fontSize: 16),
                          )),
                    )
                  ],
                ),
                isExpanded: faqItem.isExpanded))
            .toList(),
      ),
    ]);
  }
}
