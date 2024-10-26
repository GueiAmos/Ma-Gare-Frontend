import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/colors_config.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/background_widget.dart';
import '../../../widgets/menu_widget.dart';

class PgHome extends StatefulWidget {
  const PgHome({super.key});

  @override
  State<PgHome> createState() => _PgHomeState();
}

class _PgHomeState extends State<PgHome> {
  @override
  Widget build(BuildContext context) {
    List menu = [
      ["Services", Icons.build],
      ["Devis", Icons.receipt],
      ["Rendez-vous", Icons.calendar_today],
      ["Historique", Icons.history],
    ];
    return WdgBody(
      appBar: WdgAppbar("Tableau de bord"),
      drawer: WdgMenu(pageNum: 1, width: Get.width / 1.5),
      child: Container(
        color: GColor.blanc.withOpacity(0.5),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemCount: menu.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: GColor.vert.withOpacity(0.75),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(menu[index][1], color: GColor.blanc, size: 40),
                    const SizedBox(height: 5),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        menu[index][0],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: GColor.blanc,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget stat(
      {required String title, required int nbre, required String photo}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: GColor.blanc.withOpacity(0.8)),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Row(
              children: [
                Expanded(child: Image.asset(photo)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          nbre.toString(),
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: GColor.orange),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              color: GColor.bleu,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                child: Text(
                  "Gerer mes véhicules",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: GColor.blanc,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
