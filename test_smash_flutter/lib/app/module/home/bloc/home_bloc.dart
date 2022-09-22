import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_smash_flutter/app/module/home/models/countries.dart';
import 'package:test_smash_flutter/app/shared/enum.dart';

part 'events/home_event.dart';
part 'states/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    FirebaseFirestore.instance
        .collection('data-csv')
        .snapshots()
        .listen((event) {
      add(HomeListCountries(event.docs));
    });
    on<HomeListCountries>(_homeListCountries);
    on<HomeHandleCountry>(_homeHandleCountry);
  }

  _homeListCountries(HomeListCountries event, Emitter<HomeState> emit) {
    try {
      List<CountryModel> listData =
          event.data.map((x) => CountryModel.fromJson(x.data())).toList();

      listData.sort(
          (a, b) => a.country.toLowerCase().compareTo(b.country.toLowerCase()));

      emit(state.copyWith(
          countriesState: listData,
          loadingApiStatusState: LoadingApiStatus.success));
    } catch (e) {
      print(e);
      emit(state.copyWith(loadingApiStatusState: LoadingApiStatus.fail));
    }
  }

  _homeHandleCountry(HomeHandleCountry event, Emitter<HomeState> emit) {
    CountryModel data = event.data;

    data.subCountries
        .sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    emit(state.copyWith(selectedCountryState: data));
    Modular.to.pushNamed('/subCountries');
  }
}
