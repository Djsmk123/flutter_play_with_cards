import 'package:get/get_navigation/get_navigation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as proivder;
import 'package:sample_applications/constant.dart';
import 'package:sample_applications/myapp.dart';
import 'package:sample_applications/using_bloc/bloc/card_state_bloc_bloc.dart';
import 'package:sample_applications/using_bloc/widgets/home_screen_bloc.dart';
import 'package:sample_applications/using_getx/widgets/home_screen_getx.dart';
import 'package:sample_applications/using_providers/providers/cards_states_provider.dart';
import 'package:sample_applications/using_providers/widgets/home_screen_provider.dart';
import 'package:sample_applications/using_riverpod/widgets/home_screen_riverpod.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SelectionHomeScreen extends StatelessWidget {
  const SelectionHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var widgets = [
      cardWidget(context, 0, "Provider"),
      cardWidget(context, 1, "Riverpod"),
      cardWidget(context, 2, "GetX"),
      cardWidget(context, 3, "Bloc"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select State Management",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [kPrimaryColor, kSecondaryColor]),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
    );
  }

  Widget cardWidget(BuildContext context, int index, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _navigateTo(context, index),
        child: Card(
          elevation: 10,
          surfaceTintColor: kSecondaryColor,
          child: Container(
            width: 200,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [kPrimaryColor, kSecondaryColor]),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => proivder.MultiProvider(
                      providers: [
                        proivder.ChangeNotifierProvider(
                            create: (__) => CardsStateProvider()),
                      ],
                      child: const MyApp(
                        home: HomeScreenProvider(),
                      ),
                    )));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ProviderScope(
                      child: MyApp(
                        home: HomeScreenRiverPod(),
                      ),
                    )));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GetMaterialApp(
                      theme: ThemeData(useMaterial3: true),
                      debugShowCheckedModeBanner: false,
                      home: const HomeScreenGetx(),
                    )));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MultiBlocProvider(providers: [
                      BlocProvider(
                          create: (context) => CardStateProviderBloc()),
                    ], child: const MyApp(home: BlocHomeScreen()))));
    }
  }
}
