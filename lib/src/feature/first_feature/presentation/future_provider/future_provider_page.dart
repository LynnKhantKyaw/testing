import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/src/feature/first_feature/controller/state_notifier_controller.dart';
import 'package:testing/src/feature/first_feature/repository/future_repo.dart';

class FutureProviderPage extends ConsumerStatefulWidget {
  const FutureProviderPage({super.key});

  @override
  ConsumerState<FutureProviderPage> createState() => _FutureProviderPageState();
}

class _FutureProviderPageState extends ConsumerState<FutureProviderPage> {
  @override
  Widget build(BuildContext context) {
    final list = ref.watch(paylistProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: const Color(0xff579BB1),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ref.watch(futureListProvider).when(
                data: (data) {
                  return GridView.builder(
                      itemCount: list.length,
                      gridDelegate:
                          (const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      )),
                      itemBuilder: (context, index) {
                        final item = list[index];
                        return Container(
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Color(0xffE1D7C6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/flutterlog.png'),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Name ${item.value}'),
                                  item.check
                                      ? const Icon(
                                          Icons.shopping_cart,
                                          color: Color(0xff243763),
                                        )
                                      : const Icon(Icons.shopping_cart_outlined)
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                },
                error: (e, st) => Text(e.toString()),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ))),
      ),
    );
  }
}
