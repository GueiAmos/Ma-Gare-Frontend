import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';

import '../configs/colors_config.dart';

class WdgLoading extends StatelessWidget {
  const WdgLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GFLoader(
        size: GFSize.LARGE,
        type: GFLoaderType.circle,
        loaderColorOne: GColor.bleu,
        loaderColorTwo: GColor.orange,
        loaderColorThree: GColor.vert,
      ),
    );
  }
}
