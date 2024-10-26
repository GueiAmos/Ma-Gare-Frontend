import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WdgBody extends StatelessWidget {
  final Widget child;
  final Widget? drawer, floatingActionButton;
  final PreferredSizeWidget appBar;
  const WdgBody({
    super.key,
    required this.appBar,
    required this.child,
    this.floatingActionButton,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: appBar,
      drawer: drawer,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/car4.jpg"),
              ),
            ),
          ),
          child,
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
