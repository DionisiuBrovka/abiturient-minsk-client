part of 'establishment_list_bloc.dart';

@immutable
sealed class EstablishmentListState {}

final class EstablishmentListInitialState extends EstablishmentListState {}

final class EstablishmentListLoadingState extends EstablishmentListState {}

final class EstablishmentListSucsessState extends EstablishmentListState {}

final class EstablishmentListErrorState extends EstablishmentListState {}
