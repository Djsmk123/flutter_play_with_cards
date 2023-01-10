import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as proivder;
import 'package:sample_applications/myapp.dart';
import 'package:sample_applications/using_getx/home_screen_getx.dart';
import 'package:sample_applications/using_providers/providers/cards_states_provider.dart';
import 'package:sample_applications/using_providers/widgets/home_screen_provider.dart';
import 'package:sample_applications/using_riverpod/home_screen_riverpod.dart';

void main() {
  String stateManagement =
      const String.fromEnvironment('state', defaultValue: "2");
  switch (stateManagement) {
    case "1":
      runApp(
        proivder.MultiProvider(
          providers: [
            proivder.ChangeNotifierProvider(
                create: (__) => CardsStateProvider()),
          ],
          child: const MyApp(
            home: HomeScreen(),
          ),
        ),
      );
      break;
    case "2":
      runApp(
        const ProviderScope(
          child: MyApp(
            home: HomeScreenRiverPod(),
          ),
        ),
      );
      break;
    case "3":
      runApp(GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const HomeScreenGetx(),
      ));
  }
}
