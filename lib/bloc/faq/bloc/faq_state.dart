part of 'faq_bloc.dart';

@immutable
sealed class FAQState {}

final class FAQInitialState extends FAQState {}

final class FAQLoadingState extends FAQState {}

final class FAQSucsesState extends FAQState {
  final List<FAQModel> faqList;

  FAQSucsesState(this.faqList);
}

final class FAQErrorState extends FAQState {}
