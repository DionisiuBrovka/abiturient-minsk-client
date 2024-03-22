part of 'establishment_list_bloc.dart';

@immutable
sealed class EstablishmentListEvent {}

class LoadEstablishmentListEvent extends EstablishmentListEvent {}

class FilterEstablishmentListEvent extends EstablishmentListEvent {
  final List<EstablishmentModel> establishmentList;
  final String query;

  FilterEstablishmentListEvent(this.establishmentList, this.query);
}
