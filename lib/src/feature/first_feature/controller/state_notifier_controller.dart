import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/src/feature/first_feature/controller/state_notifier_list_controller.dart';

class StateNotifierController extends StateNotifier<AsyncValue<void>> {
  StateNotifierController({required this.ref}) : super(const AsyncData(null));

  Ref ref;

  void pay() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    ref.read(stateNotifierListControllerProvider.notifier).selectedList.clear();
    ref.read(stateNotifierListControllerProvider.notifier).checkData();
    state = const AsyncData(null);
  }
}

final stateNotifierControllerProvider =
    StateNotifierProvider<StateNotifierController, AsyncValue<void>>((ref) {
  return StateNotifierController(ref: ref);
});
