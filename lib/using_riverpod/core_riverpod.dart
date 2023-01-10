import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_applications/using_riverpod/controller/card_state_controller_pod.dart';
import 'package:sample_applications/using_riverpod/states/card_states_riverpod.dart';

final cardListProvider = StateNotifierProvider<CardsController, CardStates>(
    (ref) => CardsController());
