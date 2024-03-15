part of 'network_bloc.dart';

sealed class NetworkState {}

final class NetworkInitial extends NetworkState {}

final class NetworkSuccess extends NetworkState {}

final class NetworkFailure extends NetworkState {}
