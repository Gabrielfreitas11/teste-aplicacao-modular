import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_smash_flutter/app/components/custom_list_tile/custom_list_tile.dart';
import 'package:test_smash_flutter/app/module/home/bloc/home_bloc.dart';

class SubCountriesPage extends StatefulWidget {
  const SubCountriesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SubCountriesPageState createState() => _SubCountriesPageState();
}

class _SubCountriesPageState extends State<SubCountriesPage> {
  final bloc = Modular.get<HomeBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) =>
                previous.selectedCountry != current.selectedCountry,
            bloc: bloc,
            builder: (_, state) => Text(
              state.selectedCountry!.country,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          bloc: bloc,
          buildWhen: (previous, current) =>
              previous.selectedCountry != current.selectedCountry,
          builder: (_, state) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.selectedCountry!.subCountries.length,
              itemBuilder: (_, i) {
                return CustomListTile(
                  title: state.selectedCountry!.subCountries[i],
                );
              }),
        ),
      )),
    );
  }
}
