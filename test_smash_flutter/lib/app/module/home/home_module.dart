import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_smash_flutter/app/module/home/bloc/home_bloc.dart';
import 'package:test_smash_flutter/app/module/home/view/home_view.dart';
import 'package:test_smash_flutter/app/module/home/view/sub_countries.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeBloc()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
        ChildRoute('/subCountries', child: (_, args) => const SubCountriesPage()),
      ];
}
