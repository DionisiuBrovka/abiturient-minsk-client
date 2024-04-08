import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/establishment_model.dart';
import 'package:flutter_eduapp_new/pages/establishment_list/widgets/establishments_list_adapter.dart';

class EstablishmentListViewholderNoScroll extends StatelessWidget {
  const EstablishmentListViewholderNoScroll(
      {super.key, required this.establishments});

  final List<EstablishmentModel> establishments;

  @override
  Widget build(BuildContext context) {
    if (establishments.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: establishments.length,
          controller: ScrollController(keepScrollOffset: false),
          itemBuilder: (context, index) {
            return EstablishmentListAdapter(
                establishment: establishments[index]);
          });
    } else {
      return const SearchError();
    }
  }
}

class SearchError extends StatelessWidget {
  const SearchError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 80,
                color: Theme.of(context).disabledColor,
              ),
              Text(
                "Упс, что то пошло не так ...",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Мы не смогли найти учреждений образования по вашему запросу",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Theme.of(context).disabledColor),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
