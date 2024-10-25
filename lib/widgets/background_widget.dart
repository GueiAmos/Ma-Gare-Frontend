import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WdgBody extends StatelessWidget {
  final Widget child, floatingActionButton, drawer;
  final PreferredSizeWidget appBar;
  final bool isDrawer;
  const WdgBody({
    super.key,
    required this.appBar,
    required this.child,
    this.isDrawer = true,
    this.floatingActionButton = const SizedBox(),
    this.drawer = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: appBar,
      drawer: isDrawer ? drawer : null,
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
