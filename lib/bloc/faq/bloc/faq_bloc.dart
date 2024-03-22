import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_eduapp_new/data/models/faq_model.dart';
import 'package:flutter_eduapp_new/data/repositories/faq_repository.dart';
import 'package:meta/meta.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FAQBloc extends Bloc<FAQEvent, FAQState> {
  FAQBloc() : super(FAQInitialState()) {
    on<FAQEvent>((event, emit) {
      log("flutter: FAQBloc Event ${event.toString()}");
    });

    on<LoadingFAQEvent>((event, emit) async {
      emit(FAQLoadingState());
      try {
        List<FAQModel> faqList = await FAQRepository.getList();
        emit(FAQSucsesState(faqList));
      } catch (e) {
        log(e.toString());
        emit(FAQErrorState());
      }
    });
  }
}
