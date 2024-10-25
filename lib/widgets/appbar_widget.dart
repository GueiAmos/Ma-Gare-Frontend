import 'package:flutter/material.dart';

import '../configs/colors_config.dart';

AppBar WdgAppbar(String title) {
  return AppBar(
    iconTheme: IconThemeData(color: GColor.blanc),
    backgroundColor: GColor.orange,
    elevation: 0,
    automaticallyImplyLeading: true,
    //titre
    title: FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: GColor.blanc),
      ),
    ),
    //options
    actions: [
      Padding(
        padding: const EdgeInsets.only(right:10),
        child: IconButton(
          onPressed: (){},
          icon: Icon(Icons.notifications),
        ),
      ),
      // popupMenu()
    ],
  );
}
