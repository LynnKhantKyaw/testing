import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/src/feature/first_feature/controller/state_notifier_controller.dart';
import 'package:testing/src/feature/first_feature/controller/state_notifier_list_controller.dart';

class NotifierFinalState extends ConsumerWidget {
  const NotifierFinalState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateNotifierControllerProvider);
    final list =
        ref.watch(stateNotifierListControllerProvider.notifier).selectedList;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              itemCount: list.length,
              gridDelegate: (const SliverGridDelegateWithFixedCrossAxisCount(
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
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/flutterlog.png'),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              }),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            if (state.isLoading) {
              null;
            } else {
              ref.read(stateNotifierControllerProvider.notifier).pay();
            }
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
                color: Color(0xff579BB1),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: state.isLoading
                ? const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(
                      color: Color(0xffE1D7C6),
                    ),
                  )
                : const Text('Pay'),
          ),
        ),
      ),
    );
  }
}
