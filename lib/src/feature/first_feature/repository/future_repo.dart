import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/src/feature/first_feature/data/feature1_list.dart';

class FutureRepo {
  Future<List<StateNotifierModel>> futureListRepo() async {
    // List<int> lists = [for (int i = 1; i <= 100; i++) i];
    await Future.delayed(const Duration(seconds: 3));

    return [];
  }
}

final futureListRepoProvider = Provider<FutureRepo>((ref) {
  return FutureRepo();
});

final futureListProvider =
    FutureProvider.autoDispose<List<StateNotifierModel>>((ref) async {
  final provider = ref.watch(futureListRepoProvider);
  return provider.futureListRepo();
});
