import 'dart:convert';
import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/faq/bloc/faq_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/pages/faq/widgets/faq_viewholder.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';
import 'package:http/http.dart' as http;

class PageFAQ extends StatefulWidget {
  const PageFAQ({super.key});

  @override
  State<PageFAQ> createState() => _PageFAQState();
}

class _PageFAQState extends State<PageFAQ> {
  final _formKey = GlobalKey<FormState>();
  final _inputPhoneController = TextEditingController();
  final _inputEmailController = TextEditingController();
  final _inputQController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("-----==#[ BUILD PAGE - (page_faq) ]#==------");
    FirebaseAnalytics.instance.logScreenView(
        screenClass: "page_class_functional",
        screenName: "page_faq",
        parameters: {"page_title": "Вопрос ответ"});
    return Scaffold(
        appBar: CustomAppBar(
          customTitle: const Text("Вопрос ответ"),
        ),
        body: BlocBuilder<NetworkBloc, NetworkState>(builder: (context, state) {
          if (state is NetworkSuccess) {
            return BlocProvider<FAQBloc>(
              create: (context) => FAQBloc()..add(LoadingFAQEvent()),
              child: BlocBuilder<FAQBloc, FAQState>(
                builder: (context, state) {
                  if (state is FAQLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FAQSucsesState) {
                    return Column(
                      children: [
                        Image.asset(
                          "assets/faq-back.jpg",
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        ),
                        Expanded(
                          child: SizedBox(
                              width: 1000,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FAQViewholder(faqList: state.faqList),
                              )),
                        ),
                      ],
                    );
                  } else {
                    return const Text("ERROR");
                  }
                },
              ),
            );
          } else {
            return const NoNetworkPlaceholder();
          }
        }),
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Если вы не нашли ответ на свой вопрос, \nнапишите нам И мы ответим вам",
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.black38, fontSize: 16),
            ),
            const SizedBox(
              width: 8,
            ),
            FloatingActionButton(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () => feedbackForm(context),
              child: const Icon(Icons.question_answer),
            ),
          ],
        ),
        drawer: const CustomDrawer(
          selectedIndex: 7,
        ));
  }

  Future<dynamic> feedbackForm(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //icon: FaIcon(FontAwesomeIcons.folderMinus),
            title: const Text("Задайте свой вопрос"),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FAQaskView(
                formKey: _formKey,
                phoneControler: _inputPhoneController,
                eMailControler: _inputEmailController,
                qControler: _inputQController,
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: const Text("Отмена")),
              FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context, rootNavigator: true).pop();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Ваш вопрос успешно отправлен'),
                              content: const Text(
                                  'Мы уведомим вас как только найдем ответ на ваш вопрос'),
                              actions: [
                                FilledButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    },
                                    child: const Text("Ok"))
                              ],
                            );
                          });

                      try {
                        await http.post(
                            Uri(
                              scheme: 'https',
                              host: "noco.dionisiubrovka.online",
                              path: '/api/v1/db/data/noco/pcnlhd6co7jk660/QA',
                            ),
                            headers: {
                              'Content-Type':
                                  'application/x-www-form-urlencoded',
                              'xc-auth':
                                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRldi5kaW9uaXNpdS5icm92a2FAZ21haWwuY29tIiwiaWQiOiJ1c2YwYnNlNjZlN2JqYTV1Iiwicm9sZXMiOnsib3JnLWxldmVsLWNyZWF0b3IiOnRydWUsInN1cGVyIjp0cnVlfSwidG9rZW5fdmVyc2lvbiI6IjExMDk3Y2M3M2EzYmZlMzUzODg0NmRiYzQ5ODE4YzJhMzE2YWYyMWM4ZTNmZjA1ZGRjYThlNmEwYTQ5NDcxNjgyODkwYjc0N2I1ODAyMzhkIiwiaWF0IjoxNzA0NjQ2MDEzLCJleHAiOjE3MDQ2ODIwMTN9.DyV4IOV0Q9OA5xZfZImL1gCk0XaCA6WUHdX4344lIVw'
                            },
                            encoding: Encoding.getByName('utf-8'),
                            body: {
                              'q': _inputQController.text,
                              'phone': _inputPhoneController.text,
                              'email': _inputEmailController.text
                            });
                      } catch (e) {
                        log(e.toString());
                      }
                    }
                  },
                  child: const Text("Отправить"))
            ],
          );
        });
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool? isMultiLine;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const InputField(
      {super.key,
      required this.label,
      required this.hint,
      this.isMultiLine,
      required this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: isMultiLine != null && isMultiLine! ? 4 : 1,
      maxLines: isMultiLine != null && isMultiLine! ? 8 : 1,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class FAQaskView extends StatelessWidget {
  final GlobalKey formKey;
  final TextEditingController phoneControler;
  final TextEditingController eMailControler;
  final TextEditingController qControler;
  const FAQaskView({
    super.key,
    required this.formKey,
    required this.phoneControler,
    required this.eMailControler,
    required this.qControler,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputField(
                label: "Моб. телефон",
                hint: " +375(_ _)_ _ _ _ _ _ _ ",
                validator: (value) {
                  String patttern =
                      r'^((8|\+374|\+994|\+995|\+375|\+7|\+380|\+38|\+996|\+998|\+993)[\- ]?)?\(?\d{3,5}\)?[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}(([\- ]?\d{1})?[\- ]?\d{1})?$';
                  RegExp regExp = RegExp(patttern);
                  if (value == null || value.isEmpty) {
                    return 'Введите номер телефона';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Введите корректный номер телефона';
                  }
                  return null;
                },
                controller: phoneControler,
              ),
              const SizedBox(
                height: 8,
              ),
              InputField(
                label: "Электронная почта",
                hint: " exzample@mail.con ",
                validator: (value) {
                  String patttern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(patttern);
                  if (value == null || value.isEmpty) {
                    return 'Введите электронную почту';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Введите корректную электронную почту';
                  }
                  return null;
                },
                controller: eMailControler,
              ),
              const SizedBox(
                height: 8,
              ),
              InputField(
                label: "Вопрос",
                hint: "... ",
                isMultiLine: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Вопрос не может быть пустым";
                  } else {
                    return null;
                  }
                },
                controller: qControler,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ));
  }
}
