part of '../home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.countries = const <CountryModel>[],
    this.loadingApiStatus = LoadingApiStatus.idle,
    this.selectedCountry,
  });

  final List<CountryModel> countries;
  final LoadingApiStatus loadingApiStatus;
  final CountryModel? selectedCountry;

  HomeState copyWith(
      {List<CountryModel>? countriesState,
      LoadingApiStatus? loadingApiStatusState,
      CountryModel? selectedCountryState}) {
    return HomeState(
      countries: countriesState ?? countries,
      loadingApiStatus: loadingApiStatusState ?? loadingApiStatus,
      selectedCountry: selectedCountryState ?? selectedCountry,
    );
  }

  @override
  List<Object?> get props => [
        countries,
        loadingApiStatus,
        selectedCountry,
      ];
}
