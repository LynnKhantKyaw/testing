import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureRepo {
  Future<List<int>> futureListRepo() async {
    List<int> lists = [for (int i = 1; i <= 100; i++) i];
    await Future.delayed(const Duration(seconds: 3));

    return lists;
  }
}

final futureListRepoProvider = Provider<FutureRepo>((ref) {
  return FutureRepo();
});

final futureListProvider = FutureProvider.autoDispose<List<int>>((ref) async {
  final provider = ref.watch(futureListRepoProvider);
  return provider.futureListRepo();
});
