import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/src/feature/first_feature/controller/state_notifier_list_controller.dart';
import 'package:testing/src/feature/first_feature/presentation/state_notifier/notifier_final_stage.dart';

class NotifierPreviewItem extends ConsumerStatefulWidget {
  const NotifierPreviewItem({super.key});

  @override
  ConsumerState<NotifierPreviewItem> createState() =>
      _NotifierPreviewItemState();
}

class _NotifierPreviewItemState extends ConsumerState<NotifierPreviewItem> {
  void _inital() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(stateNotifierListControllerProvider.notifier).checkData();
    });
  }

  @override
  void initState() {
    _inital();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(stateNotifierListControllerProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 80,
            child: Stack(
              children: [
                Center(
                    child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotifierFinalState()));
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 40,
                  ),
                )).animate(
                  onPlay: (controller) {
                    controller.forward();
                  },
                ).shake(),
                Positioned(
                    right: 5,
                    child: Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Color(0xff579BB1), shape: BoxShape.circle),
                        child: Text(list
                            .where((e) => e.check == true)
                            .length
                            .toString()))),
              ],
            ),
          )
        ],
      ),
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
              return InkWell(
                onTap: () {
                  ref
                      .read(stateNotifierListControllerProvider.notifier)
                      .selectData(index: index);
                },
                child: Container(
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
                                ).animate(
                                  onPlay: (controller) {
                                    controller.forward();
                                  },
                                ).shake()
                              : const Icon(Icons.shopping_cart_outlined)
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
