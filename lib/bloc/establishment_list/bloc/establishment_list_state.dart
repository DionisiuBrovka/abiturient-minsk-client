part of 'establishment_list_bloc.dart';

@immutable
sealed class EstablishmentListState {}

final class EstablishmentListInitialState extends EstablishmentListState {}

final class EstablishmentListLoadingState extends EstablishmentListState {}

final class EstablishmentListSucsessState extends EstablishmentListState {
  final List<EstablishmentModel> establishmentList;
  final List<EstablishmentModel> establishmentListFiltered;

  EstablishmentListSucsessState(
      {required this.establishmentList,
      required this.establishmentListFiltered});
}

final class EstablishmentListErrorState extends EstablishmentListState {}
