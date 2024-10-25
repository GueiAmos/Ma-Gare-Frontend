import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_gare_app/screens/public/Auth/login_page.dart';
import '../../../configs/colors_config.dart';
import '../../../services/auth_service.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/input_widget.dart';
import '../Welcome/welcome_page.dart';

class PgRegister extends GetView<AuthService> {
  const PgRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController txtNomComplet = TextEditingController();
    final TextEditingController txtEmail = TextEditingController();
    final TextEditingController txtTelephone = TextEditingController();
    final TextEditingController txtPassword = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: () => Get.offAll(const PgWelcome()),
        ),
      ),
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
            color: GColor.blanc.withOpacity(0.8),
            padding: const EdgeInsets.all(25),
            height: Get.height,
            width: Get.width,
            child: Form(
              key: controller.keyFormRegister,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: Get.height / 4,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'INSCRIVEZ-VOUS !',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: GColor.noir,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //nom et prenoms
                    WdgTextField(
                      labelText: "Nom et Prénoms",
                      controller: txtNomComplet,
                      prefixIcon: const Icon(Icons.person),
                      inputColor: GColor.orange.withOpacity(0.15),
                    ),
                    const SizedBox(height: 15),

                    //telephone
                    WdgTextField(
                      labelText: "Numero de téléphone",
                      controller: txtTelephone,
                      keyboardType: TextInputType.phone,
                      prefixIcon: const Icon(Icons.phone),
                      inputColor: GColor.orange.withOpacity(0.15),
                    ),
                    const SizedBox(height: 15),

                    //email
                    WdgTextField(
                      labelText: "Email",
                      controller: txtEmail,
                      prefixIcon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                      inputColor: GColor.orange.withOpacity(0.15),
                    ),
                    const SizedBox(height: 15),

                    //mot de passe
                    WdgTextField(
                      labelText: "Mot de passe",
                      controller: txtPassword,
                      obscureText: true,
                      prefixIcon: const Icon(Icons.lock),
                      inputColor: GColor.orange.withOpacity(0.15),
                    ),
                    const SizedBox(height: 20),

                    //bouton d'inscription
                    WdgRoundButton(
                      title: "S'INSCRIRE",
                      onPressed: () => controller.register(
                        nomComplet: txtNomComplet.text.trim(),
                        telephone: txtTelephone.text.trim(),
                        motdepasse: txtPassword.text.trim(),
                        email: txtEmail.text.trim(),
                      ),
                      titleSize: 20,
                      buttonColor: GColor.vert,
                    ),

                    //compte deja existant
                    TextButton(
                      onPressed: () => Get.off(const PgLogin()),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: "Déjà inscris? ",
                              style: TextStyle(color: GColor.noir),
                            ),
                            TextSpan(
                              text: "Connectez-vous",
                              style: TextStyle(color: GColor.bleu),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
