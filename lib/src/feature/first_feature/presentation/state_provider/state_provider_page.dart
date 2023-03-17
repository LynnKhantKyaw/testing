import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xff579BB1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    ref.read(addtocartProvider.notifier).state--;
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 100,
                  ).animate(
                    onPlay: (controller) {
                      controller.forward();
                    },
                  ).shake(),
                ),
                Positioned(
                    right: 10,
                    child: Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Color(0xffE1D7C6), shape: BoxShape.circle),
                        child: Text(ref.watch(addtocartProvider).toString()))),
              ],
            ),
            const SizedBox(height: 30),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                ref.read(addtocartProvider.notifier).state++;
              },
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 45,
                decoration: const BoxDecoration(
                    color: Color(0xffE1D7C6),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Text('Add to Card'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

final addtocartProvider = StateProvider<int>((ref) {
  return 0;
});
