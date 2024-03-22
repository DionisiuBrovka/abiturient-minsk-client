part of 'faq_bloc.dart';

@immutable
sealed class FAQEvent {}

class LoadingFAQEvent extends FAQEvent {}
