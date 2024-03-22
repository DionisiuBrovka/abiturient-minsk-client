part of 'establishment_detail_bloc.dart';

@immutable
sealed class EstablishmentDetailEvent {}

class LoadEstablishmentDetailEvent extends EstablishmentDetailEvent {
  final int id;

  LoadEstablishmentDetailEvent(this.id);
}
