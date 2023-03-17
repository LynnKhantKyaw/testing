import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/src/feature/first_feature/controller/state_notifier_list_controller.dart';
import 'package:testing/src/feature/first_feature/data/feature1_list.dart';
import 'package:testing/src/feature/first_feature/presentation/state_notifier/notifier_preview_item.dart';
import 'package:testing/src/feature/first_feature/presentation/state_provider/state_provider_page.dart';

class StateNotifierPage extends ConsumerStatefulWidget {
  const StateNotifierPage({super.key});

  @override
  ConsumerState<StateNotifierPage> createState() => _StateNotifierPageState();
}

class _StateNotifierPageState extends ConsumerState<StateNotifierPage> {
  final _searchController = TextEditingController();

  void _inital() async {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ref.read(stateNotifierControllerProvider.notifier).inital();
    // });
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
      backgroundColor: const Color(0xff579BB1),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotifierPreviewItem()));
              },
              child: const Icon(Icons.list),
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
                onLongPress: () {
                  ref.read(addtocartProvider.notifier).state--;
                  ref
                      .read(stateNotifierListControllerProvider.notifier)
                      .removeData(index: index);
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
                      Text('Name ${item.value}'),
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(addtocartProvider.notifier).state++;
          ref.read(stateNotifierListControllerProvider.notifier).addData(
                data: StateNotifierModel(
                  value: ref.read(addtocartProvider).toString(),
                  check: false,
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
    ).animate().scale();
  }
}
