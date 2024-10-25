import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quickalert/quickalert.dart';

import '../configs/colors_config.dart';
import '../screens/private/Accueil/home_page.dart';
import '../services/auth_service.dart';

class WdgMenu extends StatelessWidget {
  final int pageNum;
  final double width;
  WdgMenu({super.key, required this.pageNum, required this.width});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var nom = box.read('user')['name'];
    var telephone = box.read('user')['telephone'];
    return Container(
      color: GColor.bleu.withOpacity(0.75),
      height: Get.height,
      width: width,
      child: Column(
        children: [
          Container(
            color: GColor.blanc,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            alignment: Alignment.center,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                nom.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GColor.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                telephone,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: GColor.vert,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  blocMenu(1, "Tableau de bord", Icons.dashboard, () {
                    Get.offAll(const PgHome());
                  }),
                  blocMenu(2, "Vehicules", Icons.car_crash, () {}),
                  blocMenu(3, "Rendez-vous", Icons.calendar_today, () {}),
                  blocMenu(4, "Devis", Icons.receipt, () {}),
                  blocMenu(5, "Historique", Icons.history, () {}),
                ],
              ),
            ),
          ),
          Divider(color: GColor.blanc),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Column(
              children: [
                blocMenu(6, "Paramètres", Icons.settings, () {}),
                blocMenu(7, 'Deconnexion', Icons.logout, () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    animType: QuickAlertAnimType.slideInDown,
                    title: "Êtes vous sûr(e)?",
                    text: 'Voulez vous vraiment vous déconnectez ?',
                    confirmBtnText: 'OUI',
                    cancelBtnText: 'NON',
                    showCancelBtn: true,
                    confirmBtnColor: GColor.bleu,
                    onConfirmBtnTap: () => AuthService.instance.logout(),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget blocMenu(
      int currNumPage, String titre, IconData icone, void Function()? action) {
    return Container(
      decoration: BoxDecoration(
        color: pageNum == currNumPage
            ? GColor.blanc.withOpacity(0.35)
            : Colors.transparent,
        border: Border(
          left: BorderSide(
            color: GColor.blanc,
            width: 5,
            style:
                pageNum == currNumPage ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
      ),
      child: ListTile(
        onTap: action,
        leading: Icon(icone, color: GColor.blanc, size: 30),
        title: Text(
          titre,
          style: TextStyle(
              color: GColor.blanc, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
