//Chargement circulaire
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

import 'colors_config.dart';

//Afficher un chargement
void loadingCircular() {
  Get.dialog(
    Center(
      child: CircularProgressIndicator(
        backgroundColor: GColor.blanc,
        color: GColor.bleu,
      ),
    ),
  );
}

//Afficher une notification temporairement
void snackBar({
  required String title,
  required String subtitle,
  required ToastificationType type,
}) {
  toastification.show(
    type: type,
    style: ToastificationStyle.fillColored,
    title: Text(title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
    description:
        Text(subtitle, style: const TextStyle(fontWeight: FontWeight.w500)),
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(milliseconds: 3500),
    borderRadius: BorderRadius.circular(15.0),
    boxShadow: highModeShadow,
    showProgressBar: false,
    animationDuration: const Duration(milliseconds: 500),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

//Afficher une boite de dialogue d'erreur
void errorDialog({String? errorTitle, String? errorText}) {
  Get.defaultDialog(
    title: errorTitle ?? "ECHEC",
    titleStyle: TextStyle(
      color: GColor.orange,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),
    middleText:
        errorText ?? "Une erreur est survenu. Veuillez reéssayer plus tard",
    middleTextStyle: TextStyle(
      color: GColor.noir,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );
}
