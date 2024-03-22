import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';

class PageDocumentSchedule extends StatelessWidget {
  const PageDocumentSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: const Text("График работы комисии"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/fon.jpg",
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
          const Expanded(
            child: SizedBox(
              width: 1000,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(
        selectedIndex: 3,
      ),
    );
  }
}