import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/src/feature/first_feature/data/feature1_list.dart';
import 'package:testing/src/feature/first_feature/presentation/future_provider/future_provider_page.dart';
import 'package:testing/src/feature/first_feature/presentation/state_notifier/state_notifier_page.dart';
import 'package:testing/src/feature/first_feature/presentation/state_provider/state_provider_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.animationController, required this.isDraw});

  final AnimationController animationController;

  final bool isDraw;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _isSelected = -1;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset:
          Offset(widget.isDraw ? widget.animationController.value * 288 : 0, 0),
      child: Transform.scale(
        scale: widget.isDraw
            ? widget.animationController.value * 0.8
            : 1 - widget.animationController.value,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              //  color: const Color(0xff6096B4),
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.isDraw ? 20 : 0))),
          width: double.infinity,
          child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              itemCount: FeatureOne.lableList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var item = FeatureOne.lableList[index];
                return InkWell(
                  onTap: () {
                    _isSelected = index;
                    setState(() {});
                    showGeneralDialog(
                        context: context,
                        pageBuilder: (ctx, a1, a2) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              padding: const EdgeInsets.all(20),
                              // margin: const EdgeInsets.symmetric(horizontal: 50),
                              width: 400,
                              height: 300,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(Icons.cancel))),
                                    Image.asset(
                                      'assets/images/flutterlog.png',
                                      fit: BoxFit.cover,
                                      width: 200,
                                    ),
                                    Text(
                                      item,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        Navigator.pop(context);
                                        if (index == 0) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const FutureProviderPage()));
                                        } else if (index == 2) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const StateProviderPage()));
                                        } else if (index == 3) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const StateNotifierPage()));
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 50),
                                        width: double.infinity,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff579BB1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text(
                                              'Learn More',
                                              style: TextStyle(
                                                  color: Color(0xffF8F4EA),
                                                  fontSize: 16),
                                            ),
                                            Icon(Icons.arrow_forward)
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          );
                        },
                        transitionBuilder: (context, a1, a2, child) {
                          Tween<Offset> tween = Tween(
                              begin: const Offset(0, -1), end: Offset.zero);
                          return SlideTransition(
                            position: tween.animate(CurvedAnimation(
                                parent: a1, curve: Curves.bounceInOut)),
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 500));
                  },
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        duration: const Duration(milliseconds: 100),
                        decoration:
                            const BoxDecoration(color: Color(0xff93BFCF)),
                        width: _isSelected == index
                            ? MediaQuery.of(context).size.width
                            : 0,
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        height: 40,
                        // color: const Color(0xffE1D7C6),
                        child: Consumer(
                          builder: (context, ref, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item),
                                if (index == 2)
                                  Text(ref.watch(addtocartProvider).toString())
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
