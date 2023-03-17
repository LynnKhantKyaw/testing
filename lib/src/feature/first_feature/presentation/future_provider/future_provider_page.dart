import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/src/feature/first_feature/repository/future_repo.dart';

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff579BB1),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back)),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: ref.watch(futureListProvider).when(
                        error: (e, st) => const Text('error'),
                        loading: () => const Center(
                                child: CircularProgressIndicator(
                              color: Color(0xffE1D7C6),
                            )),
                        data: (data) => ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(data[index].toString()));
                              },
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 10),
                              itemCount: data.length,
                            ))),
              ],
            ),
          )),
    );
  }
}
