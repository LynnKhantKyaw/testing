import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/src/feature/first_feature/data/feature1_list.dart';

class StateNotifierListController
    extends StateNotifier<List<StateNotifierModel>> {
  StateNotifierListController() : super([]);

  void addData({required StateNotifierModel data}) {
    state = [...state, data];
  }

  List<StateNotifierModel> selectedList = [];

  void removeData({required int index}) {
    state.removeAt(index);
    state = [...state];
  }

  void selectData({required int index}) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[i].copyWith(check: !state[i].check) else state[i]
    ];
    if (state[index].check) {
      selectedList.add(state[index]);
    } else {
      selectedList
          .removeWhere((element) => element.value == state[index].value);
    }
  }

  void checkData() {
    state = [
      for (int i = 0; i < state.length; i++)
        if (selectedList.where((e) => e.value == state[i].value).isEmpty)
          state[i].copyWith(check: false)
        else
          state[i]
    ];
    state = [...state];
  }
}

final stateNotifierListControllerProvider = StateNotifierProvider<
    StateNotifierListController, List<StateNotifierModel>>((ref) {
  return StateNotifierListController();
});
