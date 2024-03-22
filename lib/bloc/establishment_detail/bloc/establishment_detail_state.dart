part of 'establishment_detail_bloc.dart';

@immutable
sealed class EstablishmentDetailState {}

final class EstablishmentDetailInitialState extends EstablishmentDetailState {}

final class EstablishmentDetailLoadingState extends EstablishmentDetailState {}

final class EstablishmentDetailSucsesState extends EstablishmentDetailState {
  final EstablishmentModel establishment;

  EstablishmentDetailSucsesState({required this.establishment});
}

final class EstablishmentDetailErrorState extends EstablishmentDetailState {}
