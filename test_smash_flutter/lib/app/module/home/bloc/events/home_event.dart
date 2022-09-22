part of '../home_bloc.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeListCountries extends HomeEvent {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;

  HomeListCountries(this.data);

  @override
  List<Object?> get props => [data];
}

class HomeHandleCountry extends HomeEvent {
  final CountryModel data;

  HomeHandleCountry(this.data);

  @override
  List<Object?> get props => [data];
}
