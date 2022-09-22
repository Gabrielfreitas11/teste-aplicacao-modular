import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_smash_flutter/app/components/custom_list_tile/custom_list_tile.dart';
import 'package:test_smash_flutter/app/module/home/bloc/home_bloc.dart';
import 'package:test_smash_flutter/app/module/home/models/countries.dart';
import 'package:test_smash_flutter/app/shared/enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          title: const Text(
            'Countries',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => true,
          bloc: bloc,
          builder: (_, state) {
            if (state.loadingApiStatus.isIdle) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.loadingApiStatus.isFailure) {
              return const Center(
                child: Text('Problemas ao carregar banco de dados'),
              );
            }

            return NotificationListener(
                onNotification: (OverscrollIndicatorNotification overScroll) {
                  overScroll.disallowIndicator();

                  return true;
                },
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.countries.length,
                    itemBuilder: (_, i) {
                      final CountryModel data = state.countries[i];

                      return CustomListTile(
                          title: data.country,
                          onTap: () => bloc.add(HomeHandleCountry(data)));
                    }));
          },
        ),
      )),
    );
  }
}
