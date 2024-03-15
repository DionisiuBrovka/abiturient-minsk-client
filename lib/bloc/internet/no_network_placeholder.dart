import 'package:flutter/material.dart';

class NoNetworkPlaceholder extends StatelessWidget {
  const NoNetworkPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, size: 60, color: Theme.of(context).colorScheme.secondary,),
          Text("Упс, что то пошло не так ...", style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).colorScheme.secondary,)),
          Text("Проверте подключение к интернету", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.secondary,))
        ],
      ),
    );
  }
}