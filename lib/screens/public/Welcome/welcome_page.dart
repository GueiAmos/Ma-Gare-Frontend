import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/colors_config.dart';
import '../../../widgets/button_widget.dart';
import '../Auth/login_page.dart';
import '../Auth/register_page.dart';

class PgWelcome extends StatelessWidget {
  const PgWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //backgroud
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/car3.jpg"),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            color: GColor.blanc.withOpacity(0.8),
            height: Get.height,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //bloc du texte
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: Get.height / 2,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Bienvenu sur l'application",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: GColor.bleu,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "MA GARE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: GColor.orange,
                            fontSize: 50,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //bloc des boutons
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WdgRoundButton(
                        title: "Créer un compte",
                        //titleSize: 20,
                        buttonSize: 60,
                        buttonColor: GColor.vert,
                        onPressed: () => Get.to(PgRegister()),
                      ),
                      const SizedBox(height: 15),
                      WdgRoundButton(
                        title: "Accéder à mon compte",
                        buttonColor: GColor.bleu,
                        //titleSize: 20,
                        buttonSize: 60,
                        onPressed: () => Get.to(PgLogin()),
                      ),
                    ],
                  ),
                )
                //---
              ],
            ),
          ),
        ],
      ),
    );
  }
}
