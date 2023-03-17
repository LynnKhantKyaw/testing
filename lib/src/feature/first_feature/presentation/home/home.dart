import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testing/src/feature/first_feature/data/drawer_list.dart';
import 'package:testing/src/feature/first_feature/presentation/home/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));

  int _isSelected = 0;

  bool _isDraw = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff579BB1),
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: HomeScreen(
                                animationController: _animationController,
                                isDraw: _isDraw),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            child: InkWell(
                                onTap: () {
                                  _animate();
                                },
                                child: const Icon(Icons.menu)),
                          ),
                        ),
                        SizeTransition(
                          axis: Axis.horizontal,
                          sizeFactor: _animationController,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * .6,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xffEEE9DA),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        _animate();
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  const ListTile(
                                    leading: CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),
                                    title: Text(
                                      'Sout Sayar Gyi',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    subtitle: Text(
                                      'e sar',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  const Divider(),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var item = DrawerModule.drawerlist[index];
                                      return InkWell(
                                        onTap: () {
                                          _isSelected = index;
                                          setState(() {});
                                        },
                                        child: Stack(
                                          children: [
                                            AnimatedContainer(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              alignment: Alignment.centerLeft,
                                              duration: const Duration(
                                                  milliseconds: 100),
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff93BFCF)),
                                              width: _isSelected == index
                                                  ? 400
                                                  : 0,
                                              height: 40,
                                            ),
                                            Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                alignment: Alignment.centerLeft,
                                                height: 40,
                                                child: Text(item))
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (_, __) =>
                                        const Divider(),
                                    itemCount: DrawerModule.drawerlist.length,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log(_animationController.value.toString());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _animate() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
      _isDraw = false;
    } else {
      _animationController.forward();
      _isDraw = true;
    }
    log(_isDraw.toString());
    setState(() {});
  }
}
